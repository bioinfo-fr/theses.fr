"""
Compute the rate of theses written in English accross the years.
"""

using DataFrames
using CSV
using Dates

input_csv = "data/theses-soutenues.csv"

start_year = 1985
end_year = 2022


counter_english = Array{Int64,1}(undef, end_year - start_year + 1)
counter_french = Array{Int64,1}(undef, end_year - start_year + 1)
counter_missing = Array{Int64,1}(undef, end_year - start_year + 1)

# Read each row of the csv without loading the whole file in memory
for row in CSV.File(input_csv)
    # Get the year
    date = row.date_soutenance
    year = Dates.year(date)
    # Get the year index
    if year < start_year || year > end_year
        return
    end
    index = year - start_year + 1
    # Increment the counter
    if ismissing(row.langue)
        counter_missing[index] += 1
    else 
        if row.langue == "en"
            counter_english[index] += 1
        elseif row.langue == "fr"
            counter_french[index] += 1
        end
    end
end

# Write the distribution to a CSV file
# output_csv = "tmp/english_prevalence.csv"
# CSV.write(output_csv, DataFrame(year=start_year:end_year, english=counter_english, french=counter_french, missing=counter_missing))