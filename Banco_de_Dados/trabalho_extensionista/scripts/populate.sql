USE arte;

INSERT INTO usuario (usuarioID, nome, senha, tipo, participanteID)
VALUES
(1, 'Alice Santos', 'senha123', 'Artista', 1),
(2, 'Bruno Lima', 'senha123', 'Visitante', 2),
(3, 'Carlos Silva', 'senha123', 'Administrador', 3);

INSERT INTO workshop (workshopID, titulo, descricao, data, hora, duracao)
VALUES
(1, 'Pintura ao Ar Livre', 'Workshop de pintura ao ar livre.', '2024-05-01', '10:00:00', '02:00:00'),
(2, 'Escultura em Argila', 'Workshop de escultura em argila.', '2024-05-02', '14:00:00', '03:00:00');

INSERT INTO obra (obraID, titulo, descricao, dataCriacao, caminhoImagem, artistaID)
VALUES
(1, 'Amanhecer', 'Pintura do amanhecer na praia.', '2024-02-01 00:00:00', '/imagens/amanhecer.jpg', 1),
(2, 'Noite Estrelada', 'Pintura da noite estrelada.', '2024-02-02 00:00:00', '/imagens/noite_estrelada.jpg', 1);

INSERT INTO comentario (comentarioID, texto, dataComentario, usuarioID, obraID)
VALUES
(1, 'Linda obra! Adorei as cores.', '2024-02-10 00:00:00', 2, 1),
(2, 'Muito inspirador!', '2024-02-11 00:00:00', 2, 2);

INSERT INTO exposicao (exposicaoID, titulo, descricao, dataInicio, datFim)
VALUES
(1, 'Exposição de Verão', 'Obras de arte inspiradas no verão.', '2024-03-01 00:00:00', '2024-03-31 00:00:00'),
(2, 'Noites de Arte', 'Exposição com tema noturno.', '2024-04-01 00:00:00', '2024-04-30 00:00:00');

INSERT INTO inscricaoWorkshop (inscricaoID, dataInscricao, participanteID, workshopID)
VALUES
(1, '2024-04-01 00:00:00', 2, 1),
(2, '2024-04-01 00:00:00', 2, 2);

INSERT INTO visualizacaoExposicao (exposicaoID, dataVisualizacao, usuarioID)
VALUES
(1, '2024-03-05 00:00:00', 2),
(2, '2024-04-05 00:00:00', 2);

INSERT INTO avaliacaoWorkshop (avaliacaoID, dataAvaliacao, nota, comentario, participanteID, workshopID)
VALUES
(1, '2024-05-03 00:00:00', 5, 'Excelente workshop! Aprendi muito.', 2, 1),
(2, '2024-05-03 00:00:00', 4, 'Muito bom, mas poderia ser um pouco mais longo.', 2, 2);

INSERT INTO exposicao_has_obra (exposicaoID, artistaID, obraID)
VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 1),
(2, 1, 2);
