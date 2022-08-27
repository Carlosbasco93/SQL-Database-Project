# para dataframes
import pandas as pd
import numpy as np

def downcast_types(df):
    for columna in df.select_dtypes('object').columns: 
        df[columna]=df[columna].astype('category')
    for columna in df.select_dtypes(np.number).columns: 
        df[columna]=pd.to_numeric(df[columna], downcast='integer')

def eliminar_horas(column):
    column = column.replace(r"\ [0-9]{2}:[0-9]{2}:[0-9]{2}", value = "", regex = True)
    return column

def normalizar_fechas(column):
    column = eliminar_horas(column)
    column = pd.to_datetime(column)
    return column

def eliminar_duplicados(df):
    df = df.drop_duplicates().reset_index(drop = True)