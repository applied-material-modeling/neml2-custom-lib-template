[Settings]
  additional_libraries = 'build/libmylib.so'
  # on mac this is probably 'build/libmylib.dylib'
[]

[Models]
  [a_model_from_neml2]
    type = ScalarLinearCombination
    from = 'A B'
    weights = '-1.1 2.3'
    to = 'C'
  []
  [another_model_from_neml2]
    type = ScalarLinearCombination
    from = 'B C'
    weights = '0.3 -1'
    to = 'D'
  []
  ######################################### our custom model
  [my_custom_model]
    type = MyModel
    y = 'E'
    x1 = 'C'
    x2 = 'D'
  []
  #########################################
  [model]
    type = ComposedModel
    models = 'a_model_from_neml2 another_model_from_neml2 my_custom_model'
  []
[]
