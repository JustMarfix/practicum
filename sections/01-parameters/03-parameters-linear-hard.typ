#import "../../utils/core.typ": * 
#import "../../packages/cetz.typ": *

== Решение усложнённых задач с линейными уравнениями

#task[
  Найдите все значения параметра $a$, при каждом из которых система уравнений
  $
    cases(
      12cos^2x+5cos^2y+11=6a,
      15cos^2x+4cos^2y+25=12a
    )
  $
  имеет хотя бы одно решение.
]

#solve[

  Пусть $s = cos^2x$, $t = cos^2y$. Тогда:
  $
    cases(
      12s + 5t + 11 = 6a,
      15s + 4t + 25 = 12a
    )
  $

  Домножим первое уравнение на 5, а второе -- на 4. Получим:
  $
    cases(
      60s + 25t + 55 = 30a,
      60s + 16t + 100 = 48a
    ) => cases(
      25t = 30a - 55,
      16t = 48a - 100
    ) "(вычтем одно из другого)" => 9t = -18a+45 \
    "Получим:" t = 5 - 2a; s = (4a-9)/3
  $

  Переформулируем вопрос:

  Найдите все значения параметра $a$, для каждого из которых система имеет хотя бы одно решение, удовлетворяющее неравенству:

  $
    cases(
      0 <= 5 - 2a <= 1,
      display(0 <= (4a - 9)/3 <= 1)
    )
  $

  Ответ: $a in [2.25; 2.5]$
]

#task[
  Найдите все значения параметра $a$, для каждого из которых уравнение
  $
    6 log_0.25 (sin x) + a^2 + 6a + 8 = a log_4 (sin x)
  $
  имеет хотя бы одно решение.
]

#solve[
  $
    6 log_0.25 (sin x) + a^2 + 6a + 8 = a log_4 (sin x)
  $
  $
    (a + 6) log_4(sin x) = a^2 + 6a + 8
  $

  Пусть $t = log_4 sin x$, тогда:

  #theory[
    Пусть существует $f(x) = log_4x$. Нарисуем её график. Отметим на графике область значений функции $sin x$, которая равна $[0; 1]$.

    #let f1(x) = calc.log(calc.abs(x), base: 4)
    #let lined(x) = 0
    #align(center, cetz.canvas({
      import cetz.draw: *

      set-style(axes: (stroke: .5pt, tick: (stroke: .5pt)),
                legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))
      
      plot.plot(size: (12, 8),
      x-tick-step: 1,
      y-tick-step: 1, y-min: -2, y-max: 2,
      x-grid: true,
      y-grid: true,
      axis-style: "school-book",
      {
        let domain = (0.001, 7)

        plot.add(f1, domain: domain, label: $ log_4 x  $,
          style: (stroke: black), line: "raw")
        let clr = green.lighten(75%)
        if config.monochrome {
          clr = luma(75%)
        }
        plot.add(lined, domain: (0, 1), style: (stroke: clr), label: $ D_(sin x) $)
        plot.add-fill-between(f1, lined, domain: (0.0001, 1), style: (stroke: none, fill: clr))
      })
    }))

    #rect[Тогда, $log_4 sin x <= 0$, т.к. $E_(sin x) = [-1; 1]$, а $D_f = (0; +oo]$.]
  ]

  $
    (a + 6) dot t = a^2 + 6a + 8
  $

  $
  t = (a^2+6a+8)/(a+6) \
  t=((a+4)(a+2))/(a+6), a != -6
  $

  #let lined(x) = 0;
  #let curve1(x) = (x + 6) * (x + 15) * -0.17
  #let curve2(x) = (x + 4) * (x + 2) * -3
  #align(center, cetz.canvas({
    import cetz.draw: *

    set-style(axes: (stroke: .5pt, tick: (stroke: .5pt), shared-zero: true),
              legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))
    
    plot.plot(size: (12, 2),
    x-tick-step: 1,
    y-min: -1,
    y-max: 3,
    x-grid: true,
    y-tick-step: none,
    y-label: none,
    axis-style: "school-book",
    {
      let domain = (-8, 0)
      plot.add(lined, domain: domain, style: (stroke: none))
      let clr = red
      if config.monochrome {
        clr = luma(40%)
      }

      plot.add(curve1, domain: (-8, -6),
      style: (stroke: clr))
      plot.add(curve2, domain: (-4, -2),
      style: (stroke: clr))
      
      plot.add(((-2.85, 1), (-3.15, 1)), domain: domain, style: (stroke: clr))
      
      plot.add(((-7.75, 1), (-7.5, 1)), domain: domain, style: (stroke: clr))
      
      plot.add(((-4.85, 1), (-5.15, 1)), domain: domain, style: (stroke: clr))
      plot.add(((-5, 1.5), (-5, 0.5)), domain: domain, style: (stroke: clr))
      
      plot.add(((-1.15, 1), (-0.85, 1)), domain: domain, style: (stroke: clr))
      plot.add(((-1, 1.5), (-1, 0.5)), domain: domain, style: (stroke: clr))
    })
  }))

  Ответ: $a in (-oo; 6) union [-4; 2]$
]