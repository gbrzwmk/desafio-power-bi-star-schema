let
    Fonte = Csv.Document(File.Contents(PastaDados & "\dim_data.csv"), [Delimiter=",", Columns=11, Encoding=65001, QuoteStyle=QuoteStyle.Csv]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos", {{"id_data", Int64.Type}, {"data", type date}, {"ano", Int64.Type}, {"semestre", Int64.Type}, {"periodo_letivo", type text}, {"trimestre", Int64.Type}, {"mes", Int64.Type}, {"nome_mes", type text}, {"dia", Int64.Type}, {"dia_semana", type text}, {"fim_de_semana", type text}}, "en-US")
in
    #"Tipo Alterado"
