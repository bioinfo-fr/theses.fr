# Aggregate all disciplines statement into a single file, and generate a wordle

using WordCloud

stopwords = readlines(open("./data/stopwords-filter-fr.txt")) ∪ []
stopwords = map(strip, stopwords)

words_weights = processtext(open("tmp/disciplines.csv"), stopwords=stopwords, maxnum=200)
words_weights = Dict(zip(words_weights...))

maskfile = "media/mask/solid-cloud-shape-variant_mask.png"

wc = wordcloud(
    words_weights,
    mask=maskfile,
    maskcolor=0.98,
    density=0.5,
    colors=:Set1_5,
    backgroundcolor=false,
    fonts="Comfortaa",
    angles=[-π / 4, π / 4, 0.0],
)

setstate!(wc, :layout!)
generate!(wc, reposition=false)
# paint(wc, "media/plots/discplines_wordcloud.svg", background=false)
paint(wc, "media/plots/discplines_wordcloud_2.svg", background=false)
