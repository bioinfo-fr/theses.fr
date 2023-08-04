using CSV
# using ArgParse

# s = ArgParseSettings()
# @add_arg_table s begin
#     "--input"
#         help = "Input CSV file"
#     "--field"
#         help = "Field to extract"
#     "--output"
#         help = "Output CSV file"
#     "--delimiter"
#         help = "Delimiter"
#         arg_type = String
#         default = ","
# end

# parsed_args = parse_args(s)

# input_file = parsed_args["input"]
# field = parsed_args["field"]
# output_file = parsed_args["output"]
# delimiter = parsed_args["delimiter"]

input_file = "./data/theses-soutenues.csv"
field = "discipline.en"
output_file = "./tmp/disciplines.csv"
delimiter = ","

open(output_file, "w") do io
    for row in CSV.Rows(input_file, normalizenames=true, delim=',', header=1, quotechar='"')
        discipline = row.discipline_fr
        if ismissing(discipline)
            continue
        end
        write(io, discipline)
        write(io, "\n")
    end
end