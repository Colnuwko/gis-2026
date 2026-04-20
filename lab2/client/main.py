# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import pyproj
from pyproj import Transformer, CRS



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    epsg3857 = CRS.from_epsg(3857)
    ransformer = Transformer.from_crs("EPSG:3857", "EPSG:4326", always_xy=True)
    lon, lat = 50.482017517089844, 54.29159164428711  # Пример исходных координат
    x, y = transformer.transform(lon, lat)
    print(f"Преобразованные координаты: {x}, {y}")
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
