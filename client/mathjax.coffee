###
 * Federated Wiki : Mathjax Plugin
 *
 * Licensed under the MIT license.
 * https://github.com/fedwiki/wiki-plugin-mathjax/blob/master/LICENSE.txt
###

window.plugins.mathjax =
  emit: (div, item) ->
    typeset = ->
      window.MathJax.Hub.Queue ["Typeset", MathJax.Hub]


    wiki.getScript 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML', typeset
    div.append "<p>#{wiki.resolveLinks(item.text)}</p>"

  bind: (div, item) ->
    typeset = ->
      window.MathJax.Hub.Queue ["Typeset", MathJax.Hub, div.get(0)]


    wiki.getScript 'https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML', typeset
    div.on 'dblclick', () -> wiki.textEditor div, item
