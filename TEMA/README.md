# Copyright 2021 Adrian-Valeriu Croitoru

## Metode numerice - Tema de casa - Interpolare aplicata pe imagini

	In cadrul functiilor RGB, structura este aceeasi indiferent de algoritmul
 	aplicat. Se extrage fiecare canal de culoare prin sintaxa specifica (:,:,a),
	unde a = 1,2,3 este corespunzator canalelor rosu, verde si albastru. Se aplica
	metoda propriu-zisa pe fiecare canal de culoare, iar in final se foloseste
	functia cat pentru a uni cele 3 canale modificate de algoritmul de baza.

	Surrounding_points = Se foloseste floor(x) si floor(x) + 1 pentru a le incadra
			     pe x, respectiv y. Se considera cazul de exceptie in care
			     x2 sau y2 = floor(x2) + 1 iese din matrice


	### Nearest-neighbor
		-2x2 = Se compara fiecare punct cu mijlocul distantei dintre x1 si x2,
		       respectiv y1 si y2. Astfel, se determina "cadranul" in care se
		       gaseste acel punct. Unui "cadran" ii corespunde valoarea aflata
		       in colt in matricea initiala. Aceasta valoare se replica in noua
		       matrice conform metodei nn
		-resize = Se foloseste un algoritm asemanator cu cel anterior pentru a
			  determina valoarea fiecarui pixel din imaginea rescalata,
			  fiind folosite valorile din imaginea initiala. Se foloseste
			  sintaxa R(y + 1, x + 1) = I(final_y, final_x) pentru ca 
			  sistemul de numarare in Octave porneste de la (1, 1), iar
			  for-urile sunt de forma (0, p - 1); Conform skel-ului, y
			  corespunde liniilor, si x - coloanelor, de unde si sintaxa
			  aparent "inversata". -> R(y, x) in loc de R(x, y)

	### Bilinear
		-bilinear_coef = se calculeaza coeficientii de interpolare conform
				 algoritmului
		-bilinear_2x2 = se aplica algoritmul, facandu-se un cast al imaginii f
				la double pentru a putea fi apelata functia bilinear_coef
		-bilinear_resize = analog mai sus
		-bilinear_rotate = Se calculeaza cos si sin din unghiul de rotatie si se
				   gaseste matricea de rotatie. Daca x_p sau y_p se afla
				   in afara imaginii, pixelul respectiv se initializeaza cu
				   0(negru) si se trece mai departe. Mai departe, se aplica
				   in mod similar ca mai sus algoritmul de
			           bilinear interpolation
	
	### Bicubic
		-precalc_d = calculeaza derivatele pt o functie folosind diferente finite.
			     Pentru fiecare din cele 3 derivate partiale, se initializeaza
		             marginile cu 0. (la Ix - prima si ultima coloana, la Iy - prima
			     si ultima linie, iar la Ixy - intreg conturul) 
		-bicubic_coef = Se calculeaza cele 3 matrice intermediare conform algoritmului
				apare f(y, x) deoarece y corespunde axei Oy, iar x - Ox
		-bicubic_resize = Se aplica algoritmul in mod similar cu bilinear_resize si
				  nn_resize

	Feedback: Skel foarte bine realizat si organizat. PDF-ul a fost ciudat organizat
		  pe alocuri. Nu s-a inteles asa bine ideea din spatele temei, astfel ca
		  in anumite momente am simtit ca aplic mecanic niste algoritmi si atat,
		  fara sa fiu 100% constient de ce se intampla "in spate", cu poza respectiva
		  Overall, o tema interesanta si de complexitate medie spre dificila.