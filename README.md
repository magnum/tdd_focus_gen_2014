
  WALKING SKELETON

User story #1

Titolo: Mossa

Come giocatore voglio avanzare di 1 casella
  (Bottone -> il giocatore avanza di una casella)

  Dato che il giocatore è su Go!
  Quando premo il bottone "Play Turn"
  Il giocatore va su "Square 1"

  Dato che il giocatore è su "Square 21"
  Quando premo il bottone "Play Turn"
  Il giocatore va su "Square 22"

  Dato che il giocatore è su "Square 39"
  Quando premo il bottone "Play Turn"
  Il giocatore va su "Go!"


User story #2
Titolo: Muovere coi dadi
Come giocatore mi sposto di n caselle quando è il mio turno
  (Il giocatore lancia il dado e si sposta di n caselle decise dal dado)

  Given that the player is on "Go!"
  And the dice roll 7
  When I press "Play Turn"
  Then the player lands on "Square 7"

  Given that the player is on "Square 38"
  And the dice roll 3
  When I press "Play Turn"
  Then the player lands on "Square 1"


User story #3
Title: many players
Ad ogni turno cambia il giocatore

  Given a game with 4 players: Mr. Black, Mrs. White, Sr. Dog, Super Fish
  when the game starts
  it's the turn of Mr. Black

  Given a game with 4 players: Mr. Black, Mrs. White, Sr. Dog, Super Fish
  when Mr. Black press "play turn"
  then the next player will be Mrs. White

  Given a game with 4 players: Mr. Black, Mrs. White, Sr. Dog, Super Fish
  when Super Fish "play turn"
  then the next player will be Mr. Black


User story #4
Title: Roll double
When a player rolls double, he or she plays another turn



In ogni istante deve essere visibile la posizione di ogni giocatore

In ogni istante devo poter veder in quale round sono e quanti ne mancano

All'inizio tutti i giocatori sono su "Go!"
  Assumendo che i giocatori siano Pippo e Pluto
  Quando il gioco inizia
  Vedo Pippo e Pluto su Go!




