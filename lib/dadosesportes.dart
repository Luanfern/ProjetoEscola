class Esportes {
  String imagemesporte;
  String nomeesporte;
  List<String> modo;
  List<String> imagemmodo;
  List<String> imagequadra;

  Esportes({
    this.imagemesporte,
    this.nomeesporte,
    this.modo,
    this.imagemmodo,
    this.imagequadra,
  });
}

final List<Esportes> esportes = [
  Esportes(
    imagemesporte: 'imgs/boladebasquete.gif',
    nomeesporte: 'Basquete',
    modo: [
      'Campeonato',
      '5 x 5',
      '3 x 3',
      '1 x 1',
    ],
    imagemmodo: [
      'imgs/trofeucamp.png',
      'imgs/5x5.png',
      'imgs/3x3.png',
      'imgs/1x1.png',
    ],
    imagequadra: [
      'img/quadrabasquete.jpg',
      'img/meiaquadrabasquete.jpg',
    ],
  ),
  Esportes(
    imagemesporte: 'imgs/boladefutebol.gif',
    nomeesporte: 'Futebol',
    modo: [
      'Campeonato',
      'Futebol de Campo',
      'Society',
    ],
    imagemmodo: ['imgs/trofeucamp.png', '', ''],
    imagequadra: [
      'imgs/campofutebol.jpg',
      'imgs/quadrafutsal.png',
    ],
  ),
  Esportes(
    imagemesporte: 'imgs/boladehandbol.gif',
    nomeesporte: 'Handbol',
    modo: [
      'Campeonato',
      'Jogo Único',
    ],
    imagemmodo: ['imgs/trofeucamp.png', ''],
    imagequadra: [
      'imgs/quadradehandbol.jpg',
    ],
  ),
  Esportes(
    imagemesporte: 'imgs/boladevolei.gif',
    nomeesporte: 'Vôlei',
    modo: [
      'Campeonato',
      'Vôlei',
      'Vôlei de Quadra',
    ],
    imagemmodo: ['imgs/trofeucamp.png', '', ''],
    imagequadra: [
      'imgs/quadradevolei.jpg',
    ],
  ),
];
