let
    Fonte = Csv.Document(File.Contents(PastaDados & "\dim_curso.csv"), [Delimiter=",", Columns=7, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_curso", Int64.Type}, {"nome_curso", type text}, {"nivel", type text}, {"id_departamento", Int64.Type}, {"nome_departamento", type text}, {"duracao_semestres", Int64.Type}, {"qtd_disciplinas", Int64.Type}}, "en-US")
in
    #"Tipo Alterado"
