"""
Compute the distribution of years the theses were defended in.
"""

using DataFrames
using CSV
using Dates

input_csv = "tmp/theses-soutenues-filtered.csv"

# Read the CSV file into a DataFrame
df = DataFrame(CSV.File(input_csv))


# Compute the distribution of years
start_year = 2000
end_year = 2023

year_counter = Array{Int64,1}(undef, end_year - start_year + 1)

# For each thesis
foreach(row -> begin
        # Get the year
        date = row[:date_soutenance]
        year = Dates.year(date)
        # Get the year index
        if year < start_year || year > end_year
            return
        end
        index = year - start_year + 1
        # Increment the counter
        year_counter[index] += 1
    end, eachrow(df))

# Write the distribution to a CSV file
output_csv = "tmp/year_distribution.csv"
CSV.write(output_csv, DataFrame(year=start_year:end_year, count=year_counter))