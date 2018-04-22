%Harry Potter e a Câmara Secreta
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
%dobby deseja impedir que harry volte a hogwarts, porque lá não é mais seguro.


salvar(X,harry) :- impedir(X,harry,_).
% se dobby quer impedir que harry volte a hogwarts,então dobby quer salvá-lo de algum perigo.

castigado(harry,tios):-impedir(dobby,harry).
% harry foi castigado pelos tios por dobby ter tentado impedir harry de ir para hogwarts, ao jogar bolo nas visitas

tirar(harry,rony):-castigado(harry,tios),familiaweasley(rony).
%rony foi tirar harry da casa dos tios.

ir(becodiagonal).
comprarmaterial(harry,A,B):-ir(B),familiaweasley(A).
%harry foi comprar o material escolar no beco diagonal com gina e a família weasley.

encontrar(lucio,X,Y):-comprarmaterial(X,Y,becodiagonal).
%quando harry e a família weasley foram comprar o material escola no beco diagonal, eles se encontraram com lucio

colocar(lucio,diario,X):-encontrar(lucio,harry,X), !.
%lucio colocou o diário de voldemort no caldeirão da gina.

escrever(diario,X):- colocar(lucio,diario,X).
%gina começou a escrever seus sentimentos no diário

influenciar(Y,diario,X):-escrever(diario,X),herdeiro(Y).
%e foi influenciada ,pela essência de voldemort presa ao diário, a cometer ataques contra alunos nascidos trouxas na escola de hogwarts.

%o principal foco era os nascidos trouxas, mas eles não foram os únicos a serem atacados
sangueruim(justino).
% justino é denominado sangue ruim, pois, ou um de seus pais ou ambos não são bruxos.
sangueruim(colin).
sangueruim(hermione).
sangueruim(murta-que-geme).

monstro(basilisco).
monstro(aranha).

temivel(X):-monstro(X), !.
%existem dois tipos de monstros que são suspeitos de serem o monstro dentro da câmara secreta.
%Mas o monstro da câmara secreta é um monstro que as aranhas temem.

petrificado(X,Y):-sangueruim(X),temivel(Y).
%todos os alunos sangue ruim foram petrificados por um monstro que é temido por outros monstros

suspeito(malfoy).
suspeito(hagrid).
prepararpocao(hermione,harry,rony).
acharculpado(A,B,C,D):-prepararpocao(A,B,C),suspeito(D).
%harry,hermione e rony suspeitavam que era malfoy ou hagrid o responsável pelos ataques aos alunos

abrir(X,camara):-influenciar(voldemort,diario,X).
%a pessoa influenciada pelo diario de voldemort, foi quem abriu a câmara
levada(X):- abrir(X,camara).
%e no final acabou sendo levada pelo próprio monstro

local(banheiro).
local(salacomunal).
local(masmorra).
assombrar(murtaquegeme).
entrada(X,Y):-local(X),assombrar(Y),!.
%a entrada da câmara é um local assombrado pela murta-que-geme

resgatar(harry,X):-levada(X).
%harry vai resgar a pessoa que foi levada pelo monstro

entrarcamara(harry,X,Z):- entrada(X,_),falar(harry,Z).
%harry entra na câmara, por ter a capacidade de falar a língua das cobras, para enfim salvar a pessoa que foi levada

arma(harry,fenix).
arma(harry,espada).
arma(harry,chapeuseletor).
arma(hermione,inteligencia).
arma(rony,coragem).

armas(X,Y):- arma(X,Y).
armas(X,Y):- arma(X,Z),armas(Z,Y).

lutar(X,W,Y,Z):- herdeiro(X),temivel(W),armas(Y,Z).
%quando ele entra na câmara terá que lutar com o herdeiro de sonserina e seu monstro( o monstro usado para atacar os estudantes).
%ele também foi capaz de lutar contra esse inimigo com a ajuda de seus amigos, hermione, mesmo estando petrificada e rony.







