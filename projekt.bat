@echo off

:menu
echo Zadanie z Algorytmiona - Krzysztof Guminski
echo .
echo 1. Uruchom program
echo 2. Wyswietl tresc zadania
echo 3. Wyjscie
echo .
set /p wybor=Wybierz jedna z powyzszych opcji (1-3)

if %wybor% == 1 goto opcja1
if %wybor% == 2 goto opcja2
if %wybor% == 3 goto exit
echo Musisz wybrac liczbe od 1 do 3
goto menu

:opcja1
IF EXIST raport.html DEL raport.html
IF NOT EXIST output mkdir output
echo "<HTML>" >> raport.html
DEL /Q output
for /f "delims=" %%a in ('dir /b input') do (
	echo -%%a
	 call python duzeLiczby.py %%a "wynik" 
)
call python raport.py
goto menu
:opcja2
echo W wielu przypadkach (np. w rachunku prawdopodobienstwa) spotykamy sie z potrzeba
echo	obliczania liczb np. typu Cn,k = n!/(k!(n-k)!).
echo	Mozemy tu napotkac nastepujacy problem: chociaz koncowy wynik jest stosunkowo
echo	maly, to liczby wystepujace w liczniku i mianowniku moga byc ogromne (np. C4,100 = 3921225, ale liczba 100! ma az 158 cyfr!)
echo	O ile w przykladzie tym mozemy program "nauczyc" jak obliczac tego typu liczby bez
echo	wykorzystywania dodatkowych bibliotek dla duzych liczb (w tym przykladzie mamy: C4,100 = 97*49*33*25), to nie zawsze da sie to tak latwo
echo	zrobic, np. wyrazenie 13*55*2**13*3**5*7**2*100!/(83*89*97*49!*67!)
echo 	po uproszczeniu sprowadza sie do liczby 409457, ale
echo	w tym przypadku "nauczenie" programu obliczania wartosci takich wyrazen (jak w poprzedni sposob) moze byc trudne lub niewykonywalne
echo	Zalozmy, ze w wyrazeniach beda wystepowaly tylko liczby naturalne nie wieksze od 100
echo	(tak jak w powyzszym przykladzie - nie wieksze od 100 jako "skladowe" wyrazenia).
echo	Zaproponuj, opisz i zaimplementuj metode obliczania wartosci takich wyrazen (bez
echo	korzystania z bibliotek dla duzych liczb).
goto menu
:exit
