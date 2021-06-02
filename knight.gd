extends KinematicBody2D


export (int) var speed = 200
enum States {spada, scettro, rampino}
var _state : int = States.spada
var velocity = Vector2()
var die = false
var isAttacking = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func get_input():
	
#
	
#	var m = get_global_mouse_position()
#	var aim_speed = deg2rad(3)
#	if $Sprite5.get_angle_to(m) > 0:
#		$Sprite5.rotation += aim_speed
#	else:
#		$Sprite5.rotation -= aim_speed
	
		
	#$Sprite.look_at(get_global_mouse_position())
	
	#$braccioscudo.look_at(get_global_mouse_position())
	
	velocity = Vector2()
	
	
#	if Input.is_action_pressed('ui_up'):
#		velocity = Vector2(-speed/3, 0).rotated(rotation)
#	if Input.is_action_pressed('ui_down'):
#		velocity = Vector2(speed, 0).rotated(rotation)
   
	if die == false:
		if Input.is_action_pressed('ui_right') and isAttacking==false:
			#	$Polveresx.visible = true
			#	$Polveredx.visible = false
#			$Exhaust2.emitting = false
#			$Exhaust.emitting = true
			velocity.x += 1
			#	if isrolling==true:
			#		velocity.x += 145
			#	right = true
			#	left = false
	
			
		if Input.is_action_pressed('ui_left') and isAttacking==false:
			#	$Polveresx.visible = false
			#	$Polveredx.visible = true
#			$Exhaust.emitting = false
#			$Exhaust2.emitting = true
			velocity.x -= 1
			#	left = true
			#	right = false

		if Input.is_action_pressed('ui_down') and isAttacking==false:
			velocity.y += 1
			
		if Input.is_action_pressed('ui_up') and isAttacking==false:
			velocity.y -= 1
			
		if Input.is_action_just_pressed('mouse_click') :
			if _state == States.scettro:
				$AnimatedSprite.play("Attaccoscettro")
				$AnimatedSprite.set_frame(0)
			if _state == States.spada:
				$AnimatedSprite.play("Attaccospada")
				$AnimatedSprite.set_frame(0)
				#$Sprite/mani/Area2D4/CollisionShape2D.disabled = false
			isAttacking=true
			#$AnimatedSprite.play("Attack")
			#shoot()	
		
		#	if Input.is_action_pressed('roll') and isAttacking==false:
		#		if Input.is_action_pressed('ui_right') and isAttacking==false:
		#			velocity.x += 115
		#		if Input.is_action_pressed('ui_left') and isAttacking==false:
			#		velocity.x -= 115
			
		#		$Sprite.visible = false
		#		$AnimatedSprite.play("roll")
		#		isrolling=true
			
		#	if Input.is_action_just_pressed('bomb') and can_drop_bomb==true:
		#		placebomb()	
		velocity = velocity.normalized() * speed
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	pass
 if die == false:
		get_input()
		#if $Sprite/mani/RayCast2D.is_colliding():
			#var origin = $Sprite/mani/RayCast2D.global_transform.origin
			#var collision_point = $Sprite/mani/RayCast2D.get_collision_point()
			#distance = origin.distance_to(collision_point)
		#var dir = get_global_mouse_position() - global_position
		# $Sprite5.rotation = (get_global_mouse_position() - sprite.position).angle() # Might need to add + PI / 2 here
		
		# print(get_global_mouse_position())
	#	if dir.length() > 5:
	#	   rotation = dir.angle()
	#	   velocity = move_and_slide(velocity)
		if (velocity.x != 0  or velocity.y != 0) and isAttacking==false :
			$AnimatedSprite.play("Run")

			$AnimatedSprite.flip_v = false
			# See the note below about boolean assignment
			$AnimatedSprite.flip_h = velocity.x < 0
			
			

		
		elif  (velocity.x == 0  and velocity.y == 0) and isAttacking==false :
				#$Polveresx.visible = false
				#$Polveredx.visible = false
				$AnimatedSprite.play("Idle")
				
	#	elif velocity.y != 0:
	#
	#		$AnimatedSprite.flip_v = velocity.y > 0
			
		#var aa = get_global_mouse_position()
	#	if(aa.y>=280):
	#
	#		$Sprite4.flip_h = false
	#		$Sprite6.flip_h = false
	#
	#	elif(aa.y<=280):
	#		$Sprite4.flip_h = true
	#		$Sprite6.flip_h = true
		
			
	#	if(aa.x<=380):
	#		print('bmbmnmbmmnm')
	#		$Sprite6.visible  = true
	#	elif(aa.x>=380):
	#		print('bmbmnmbmmnm')
	#		$Sprite6.visible  = false
		velocity = move_and_slide(velocity)




func _on_AnimatedSprite_animation_finished():
		if $AnimatedSprite.animation=="Attaccospada":
		#$Area2D/CollisionShape2D.disabled=true
			isAttacking=false
#	if $AnimatedSprite.animation=="roll":
#		isrolling=false
#		$Sprite.visible = true
#	if $AnimatedSprite.animation=="die":
#		get_node("../CanvasLayer/Label").visible = true
#		get_node("../CanvasLayer/Button").visible = true


func _on_Area2D_area_entered(area):
	if area.is_in_group("doordx"):
	#	_transition_rect.transition_to()
		position.x+= 480
	if area.is_in_group("doorsx"):
		position.x-= 480
	if area.is_in_group("doorup"):
		position.y-= 360
	if area.is_in_group("doordw"):
		position.y+= 360
