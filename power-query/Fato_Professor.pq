let
    Fonte = Csv.Document(File.Contents(PastaDados & "\fato_professor.csv"), [Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_fato", Int64.Type}, {"id_professor", Int64.Type}, {"id_departamento", Int64.Type}, {"id_curso", Int64.Type}, {"id_disciplina", Int64.Type}, {"id_data_oferta_disciplina", Int64.Type}, {"id_data_oferta_curso", Int64.Type}, {"periodo_letivo", type text}, {"carga_horaria_disciplina", Int64.Type}, {"qtd_turmas", Int64.Type}, {"horas_ministradas", Int64.Type}}, "en-US")
in
    #"Tipo Alterado"
