let
    Fonte = Csv.Document(File.Contents(PastaDados & "\dim_professor.csv"), [Delimiter=",", Columns=9, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_professor", Int64.Type}, {"nome_professor", type text}, {"titulacao", type text}, {"regime_trabalho", type text}, {"data_contratacao", type date}, {"id_departamento", Int64.Type}, {"nome_departamento", type text}, {"campus", type text}, {"coordenador_departamento", type text}}, "en-US")
in
    #"Tipo Alterado"
