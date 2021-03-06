# Wondev Woman

Repository for CodinGame's Wondev Woman

![Wondev Woman](wondev-woman.jpg)

![Gameplay](grid.jpg)

[Rejestracja na stronie CodinGame](https://www.codingame.com/servlet/urlinvite?u=543181)

[Strona z zadaniem konkursowym](https://www.codingame.com/multiplayer/bot-programming/wondev-woman)

## Leagues

## Wood 3 League

Gra kończy się po zdobyciu pierwszego punktu. Okazuje się, że strategia polegająca na wykonywaniu pierwszego dozwolonego ruchu jest strategią wygrywającą i udaje się pokonać TreBossa ;-)

Rozwiązanie w pliku [wood_3_league.dart](wood_3_league.dart)

## Wood 2 League

W tym przypadku gra toczy się do momentu, gdy zabraknie dozwolonych ruchów i należy zdobyć więcej punktów niż przeciwnik. Strategia z poprzedniej ligii umożliwia czasami wygraną z MaruBossem, ale nie pozwala na przejście do wyższej ligii. Patrząc na rozgrywkę daje się niestety zauważyć, że nieumiejętne wykonywanie ruchów prowadzi do zablokowania pionka. Maksymalna zdobyta pozycja to ok. 170/290.

W celu wyliczenia najlepszego ruchu zastosujmy następujący algorytm:
* każda wczytywana komórka planszy ma wysokość od 0 do 3,
* dla każdego dozwolonego ruchu obliczmy sumę wysokości komórki, na którą możemy przejść oraz komórki, którą możemy zbudować,
* wybierzmy dozwolony ruch o największej obliczonej sumie.

Taki algorytm umożliwia przejście do ligi Wood 1 :-)

Rozwiązanie w pliku [wood_2_league.dart](wood_2_league.dart)

## Wood 1 League

Nowe zasady, które pojawiły się w tej lidze to:
* gracz steruje dwoma pionkami,
* pionek gracza może popchnąć pionek przeciwnika w dozwolonym dla niego kierunku - pojawiła się akcja PUSH&BUILD

Wady dotychczasowego algorytmu:
* pionek nadal może się zablokować,
* pierwszy pionek rusza się częściej, drugi bardzo rzadko

## Other languages

Jeżeli chcesz zaproponować oraz zacommitować:
* dalszą część rozwiązania,
* inny sposób rozwiązania,
* rozwiązanie w innym języku programowania,

to skontaktuj się ze mną przez:
* [Facebook](https://www.facebook.com/profile.php?id=100007494036323)
* [LinkedIn](https://www.linkedin.com/in/dominisz/)
* [CodinGame](https://www.codingame.com/profile/5dfcc3023c4b7b6e7f129c9b9b9bf9ff181345)
