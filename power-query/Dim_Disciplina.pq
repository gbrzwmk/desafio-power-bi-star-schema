let
    Fonte = Csv.Document(File.Contents(PastaDados & "\dim_disciplina.csv"), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_disciplina", Int64.Type}, {"nome_disciplina", type text}, {"carga_horaria", Int64.Type}, {"qtd_pre_requisitos", Int64.Type}, {"pre_requisitos", type text}}, "en-US")
in
    #"Tipo Alterado"
