# Analysis of French (bioinformatics) theses from theses.fr data

Source code for a future article on [bioinfo-fr.net](https://bioinfo-fr.net/), studying some French theses statistics.

<p style="text-align: center;">
<img src="./media/plots/discplines_wordcloud.svg" alt="Wordcloud of French theses disciplines" width="500"/>
</p>

All contributions are welcome!

## Data source

- [theses.fr](https://www.theses.fr/);
- theses.fr data dump on data.gouv.fr <https://www.data.gouv.fr/fr/datasets/theses-soutenues-en-france-depuis-1985/> (dump of 2023-01-20 used here).

## Requirements

- Python3
- Julia
- Conda/Mamba

## Setup


1. Clone the repository

```bash
git clone git@github.com:bioinfo-fr/theses.fr.git
```

2. Setup the conda environment

```bash
conda env create -f environment.yml
conda activate theses-bioinfo-fr
```

3. Setup Julia environment

```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

## References

- [theses.fr](https://www.theses.fr/)
- [richarddelome/theses.fr _Some stats about all French PhD dissertations since 1985_](https://github.com/richarddelome/theses_fr)
