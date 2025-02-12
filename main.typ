#import "utils/core.typ": notes
#import "config.typ"

#show: notes.with(
  name: "Конспекты практикумов к ЕГЭ по профильной математике",
  short-name: "Практикумы к ЕГЭ по профильной математике",
  lector: "Доронин Алексей Владимирович",
  info: "2024-2025",
)

#include "sections/01-parameters/!sec.typ"

#if config.appendix {
  include "appendix.typ"
}
