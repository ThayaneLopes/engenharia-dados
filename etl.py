vendas = [ {"cliente": "Ana", "valor": 120}, {"cliente": "João", "valor": 200}, {"cliente": "Maria", "valor": 150} ]
total = sum(v["valor"] for v in vendas) 
media = total / len(vendas) 
print("Total:", total) 
print("Média:", media)