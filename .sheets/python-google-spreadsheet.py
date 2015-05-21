import gspread

gc = gspread.login("srijan@antaragni.in", "")
wks = gc.open("Test Batting & Test Bowling Data for IITK.xlsx").sheet1

rows = []
for i in range(1,1405):
    rows.append(wks.row_values(i))

del rows[0]

for row in rows:
    try:
        if i == 1:
            print row[1]
    except:
        pass
