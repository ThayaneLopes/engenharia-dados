select
    total_bill,
    tip,
    sex,
    day,
    total_bill + tip as valor_total
from read_csv_auto('C:/Users/tl100/OneDrive/Documents/Carreira dados/teste-volta/pandas/tips.csv')
