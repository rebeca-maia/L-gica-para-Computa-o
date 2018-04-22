%Harry Potter e a C�mara Secreta
familiaweasley(gina).
familiaweasley(rony).
familiaweasley(molly).
familiaweasley(arthur).
familiaweasley(fred).
familiaweasley(jorge).
familiaweasley(percy).

casa(harry,grifinoria).
casa(voldemort,sonserina).
casa(malfoy,sonserina).

falar(harry,ofidioglossia).
falar(voldemort,ofidioglossia).
herdeiro(X):-falar(X,ofidioglossia),casa(X,sonserina).

perigoso(hogwarts).
impedir(dobby,harry,X):-perigoso(X).
%dobby deseja impedir que harry volte a hogwarts, porque l� n�o � mais seguro.


salvar(X,harry) :- impedir(X,harry,_).
% se dobby quer impedir que harry volte a hogwarts,ent�o dobby quer salv�-lo de algum perigo.

castigado(harry,tios):-impedir(dobby,harry).
% harry foi castigado pelos tios por dobby ter tentado impedir harry de ir para hogwarts, ao jogar bolo nas visitas

tirar(harry,rony):-castigado(harry,tios),familiaweasley(rony).
%rony foi tirar harry da casa dos tios.

ir(becodiagonal).
comprarmaterial(harry,A,B):-ir(B),familiaweasley(A).
%harry foi comprar o material escolar no beco diagonal com gina e a fam�lia weasley.

encontrar(lucio,X,Y):-comprarmaterial(X,Y,becodiagonal).
%quando harry e a fam�lia weasley foram comprar o material escola no beco diagonal, eles se encontraram com lucio

colocar(lucio,diario,X):-encontrar(lucio,harry,X), !.
%lucio colocou o di�rio de voldemort no caldeir�o da gina.

escrever(diario,X):- colocar(lucio,diario,X).
%gina come�ou a escrever seus sentimentos no di�rio

influenciar(Y,diario,X):-escrever(diario,X),herdeiro(Y).
%e foi influenciada ,pela ess�ncia de voldemort presa ao di�rio, a cometer ataques contra alunos nascidos trouxas na escola de hogwarts.

%o principal foco era os nascidos trouxas, mas eles n�o foram os �nicos a serem atacados
sangueruim(justino).
% justino � denominado sangue ruim, pois, ou um de seus pais ou ambos n�o s�o bruxos.
sangueruim(colin).
sangueruim(hermione).
sangueruim(murta-que-geme).

monstro(basilisco).
monstro(aranha).

temivel(X):-monstro(X), !.
%existem dois tipos de monstros que s�o suspeitos de serem o monstro dentro da c�mara secreta.
%Mas o monstro da c�mara secreta � um monstro que as aranhas temem.

petrificado(X,Y):-sangueruim(X),temivel(Y).
%todos os alunos sangue ruim foram petrificados por um monstro que � temido por outros monstros

suspeito(malfoy).
suspeito(hagrid).
prepararpocao(hermione,harry,rony).
acharculpado(A,B,C,D):-prepararpocao(A,B,C),suspeito(D).
%harry,hermione e rony suspeitavam que era malfoy ou hagrid o respons�vel pelos ataques aos alunos

abrir(X,camara):-influenciar(voldemort,diario,X).
%a pessoa influenciada pelo diario de voldemort, foi quem abriu a c�mara
levada(X):- abrir(X,camara).
%e no final acabou sendo levada pelo pr�prio monstro

local(banheiro).
local(salacomunal).
local(masmorra).
assombrar(murtaquegeme).
entrada(X,Y):-local(X),assombrar(Y),!.
%a entrada da c�mara � um local assombrado pela murta-que-geme

resgatar(harry,X):-levada(X).
%harry vai resgar a pessoa que foi levada pelo monstro

entrarcamara(harry,X,Z):- entrada(X,_),falar(harry,Z).
%harry entra na c�mara, por ter a capacidade de falar a l�ngua das cobras, para enfim salvar a pessoa que foi levada

arma(harry,fenix).
arma(harry,espada).
arma(harry,chapeuseletor).
arma(hermione,inteligencia).
arma(rony,coragem).

armas(X,Y):- arma(X,Y).
armas(X,Y):- arma(X,Z),armas(Z,Y).

lutar(X,W,Y,Z):- herdeiro(X),temivel(W),armas(Y,Z).
%quando ele entra na c�mara ter� que lutar com o herdeiro de sonserina e seu monstro( o monstro usado para atacar os estudantes).
%ele tamb�m foi capaz de lutar contra esse inimigo com a ajuda de seus amigos, hermione, mesmo estando petrificada e rony.







