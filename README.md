# BraingStorming Bowling



El juego de Bowling viene con partidas o `lineas` 

Una linea (line) podría representarse como una partida

Nro of Rolls: Reflejará la cantidad de lanzamientos que se tuvo.

Total Score: Indica la puntuación de la partida luego de haber lanzados todos los tiros

## 1. Frames

Cada linea contiene 10 frames. 

- ScoreType: `strike` | `spare` | `open`

- Array of Throw: Lanzamientos
- Frame Number: Indica el número de frame al que está posicionado
- PinsKnockDown: Indica el número de pins derribado en este frame



### Conceptos Claves

**Strike**: Se derriban todos los pins es igual a 10 se anota como `X`

**Spare**: Se derriban todos los pins en 2 intentos, se lo anota como `/`

**Open**: No se logró derribar los 10 pins y se anota el número de pines derribados, ejemplo (4, 0, 9,2,5)



## 2. Throw (Lanzamientos)

 La puntuación no puede pasar del número 10

atributos principales

- Score: Número de pins derribados







## Combinaciones Posibles para el Cálculo de la puntuación

- Strike + Strike + Strike => XXX 
- Strike + Strike + Pins => XX2
- Strike + Spare => X7/
- Strike + Open => X00
- Spare + Strike => 7/X
- Open => 12 | 90 | 12
- Spare + Pins => 7/8



## Installation and Run

Requirements

- ruby 2.6.2

### Testing

```bash
ruby test/bowling_test.rb
```

```ruby
def test_exercise_one
    example = 'XXXXXXXXXXXX'
    assert_equal(300, @game.run(example))
  end

  def test_exercise_two
    example = '9-9-9-9-9-9-9-9-9-9-'
    assert_equal(90, @game.run(example))
  end

  def test_exercise_three
    example = '5/5/5/5/5/5/5/5/5/5/5'
    assert_equal(150, @game.run(example))
  end

  def test_all_zero
    example = '00000000000000000000'
    assert_equal(0, @game.run(example))
  end

## All passed! :)
```

