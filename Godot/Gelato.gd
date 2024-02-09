extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var anim_frame = 0
var anim_index = 0
var anim_map = {}
var anims = ["blueberry", "bubblegum","cherry","chocolate","coffee","custard","edamami","jellyfish",
"lemon", "lime", "mango", "pear", "pumpkin", "sesami_seed", "soda", "squid_ink", "strawberry", "vanilla"]


# Called when the node enters the scene tree for the first time.
func _ready():
	# Setting up anim_map as a permutation of all animations
	var key = 0;
	var rng = RandomNumberGenerator.new()
	#var test = anims.size()
	while (key < anims.size()):
		var my_random_number = rng.randi_range(0, anims.size() - 1)
		var anim = anims[my_random_number]
		var not_present = true
		for item in anim_map:
			if anim_map[item] == anim:
				not_present = false
				break
				
		if not_present:
			anim_map[key] = anim
			key += 1
			
	var test = anim_map[anim_index]
	
	# TODO figure out how to set the first image to the first in map
	#$GelatoSprite.animation = anim_map[anim_index].
	#$GelatoSprite.animation = 'bubblegum'
	
func _input(event):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_KinematicBody2D_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		anim_frame += 1 
		# Checking if time to switch animation
		if anim_frame > 8:
			anim_index += 1
			if not anim_map.has(anim_index):
				anim_index = 0
			$GelatoSprite.animation = anim_map[anim_index]
			#$GelatoSprite.animation = "blueberry"
			anim_frame = 0
		$GelatoSprite.frame = anim_frame
		$eat_noise.playing = true
