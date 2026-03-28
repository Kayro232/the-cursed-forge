extends Node2D
#variable para definir que hacer luego en el futuro
var forjar = true
# variables de los botones
@onready var boton_forjar = $Control/forjar
@onready var boton_combinar = $Control/combinar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if forjar:
		$Control/combinar.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func forjar_button() -> void:
	forjar = true
	animacion_eliminar(boton_combinar, true)  # ocultar botones de combinar
	animacion_eliminar(boton_forjar, false)   # mostrar boton forjar


func combinar_button() -> void:
	forjar = false
	animacion_eliminar(boton_forjar, true)   # ocultar boton forjar
	animacion_eliminar(boton_combinar, false) # mostrar botones combinar


#animacion para desaparecer(utilizala cuando quieras eliminar algo o aparecer)
func animacion_eliminar(cosa_eliminar, eliminar: bool):
	var tween = create_tween()
	if eliminar:
		tween.tween_property(cosa_eliminar, "modulate:a", 0.0, 0.3)
		tween.finished.connect(func():
			cosa_eliminar.visible = false
		)
	else:
		cosa_eliminar.visible = true
		cosa_eliminar.modulate.a = 0.0
		tween.tween_property(cosa_eliminar, "modulate:a", 1.0, 0.3)
	
