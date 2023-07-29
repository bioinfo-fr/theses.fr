"""
Compute the distribution of years the theses were defended in.
"""

using DataFrames
using CSV
using Dates

input_csv = "tmp/theses-soutenues-filtered.csv"

# Compute the distribution of years
start_year = 1985
end_year = 2022

year_counter = Array{Int64,1}(undef, end_year - start_year + 1)

# For each thesis
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
    year_counter[index] += 1
end

# Write the distribution to a CSV file
output_csv = "tmp/year_distribution.csv"
CSV.write(output_csv, DataFrame(year=start_year:end_year, count=year_counter))