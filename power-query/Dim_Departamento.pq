let
    Fonte = Csv.Document(File.Contents(PastaDados & "\dim_departamento.csv"), [Delimiter=",", Columns=5, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_departamento", Int64.Type}, {"nome_departamento", type text}, {"campus", type text}, {"id_professor_coordenador", Int64.Type}, {"nome_coordenador", type text}}, "en-US")
in
    #"Tipo Alterado"
