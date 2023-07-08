"""
Filter data.gouv.fr dataset csv file to keep only some informations
"""

import pandas as pd
import os

TEMP_DIR = "tmp"
DATA_DIR = "data"
DATA_FILE = "theses-soutenues.csv"
FILTERED_DATA_FILE = "theses-soutenues-filtered.csv"


def load_only_columns(
    columns=[
        "auteurs.0.idref",
        "auteurs.0.nom",
        "auteurs.0.prenom",
        "directeurs_these.6.idref",
        "directeurs_these.6.nom",
        "directeurs_these.6.prenom",
        "date_soutenance",
        "discipline.fr",
        "discipline.en",
        "langue",
        "resumes.fr",
        "resumes.en",
        "titres.fr",
        "titres.en",
    ]
):
    """
    Load only some columns from the csv file
    """
    df = pd.read_csv(os.path.join(DATA_DIR, DATA_FILE), usecols=columns)
    return df


def main():
    df = load_only_columns()
    df.to_csv(
        os.path.join(TEMP_DIR, FILTERED_DATA_FILE),
        index=False,
        header=True,
        sep=",",
        encoding="utf-8",
        quoting=1,
        quotechar='"',
    )


if __name__ == "__main__":
    main()
