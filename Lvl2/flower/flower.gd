extends CharacterBody2D

var body_entered = false
var shoot_flag = false
var shoot_timeout_flag = false
@export var bullet : PackedScene

func _ready():
	$Timer1.start()

func _on_detector_body_entered(body):
	if body.name == "Player":
		body_entered = true

func _on_detector_body_exited(body):
	if body.name == "Player":
		body_entered = false

func _on_timer_1_timeout():
	if body_entered == true:
		var bul = bullet.instantiate()
		bul.tsx = -1
		add_child(bul)
		bul.transform = $Node/Marker2D.global_transform
		
func _on_timer_2_timeout():
	if body_entered == true:
		var bul = bullet.instantiate()
		bul.tsx = 1
		add_child(bul)
		bul.transform = $Node/Marker2D.global_transform
	
#func shoot():
	#var b = bullet.instantiate()
	#print(121)
	#b.tsx = 1
	#add_child(b)
	#b.transform = $Node/Marker2D.global_transform
	#shoot_flag = true
				#
	#print(b.bullet_destroy)
	#if b.bullet_destroy == true:
		#shoot_flag = false
				
	
	
func _physics_process(delta):
	var player = $"../Player"
	var direction = (player.position - self.position).normalized()
	$AnimatedSprite2D.flip_h = false
	#print(player.position)
	#print(self.position)
	
	if body_entered == true:
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("attack")
			$Timer2.start()
			
		elif direction.x >= 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("attack")
			$Timer1.start()
			
		
			#if shoot_flag == false:
				#
				#shoot_flag = true
				#print(shoot_timeout_flag)
				#if shoot_timeout_flag == true:
					#shoot_flag = false
					#shoot_timeout_flag = false
			
	else:
		$AnimatedSprite2D.play("idle")