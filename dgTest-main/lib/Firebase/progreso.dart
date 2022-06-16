class coleccion_progreso {
  final int nivel;
  final int progreso;

  coleccion_progreso(this.nivel,this.progreso);

  coleccion_progreso.fromJson(Map<dynamic, dynamic> json)
    : nivel = json['nivel'] as int,
      progreso = json['progreso'] as int;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'nivel': nivel,
    'progreso': progreso,
  };
}