#include "MyModel.h"
#include <neml2/base/Registry.h>

namespace neml2
{
register_NEML2_object(MyModel);

OptionSet
MyModel::expected_options()
{
  OptionSet options = Model::expected_options();
  options.set_output("y");
  options.set_input("x1");
  options.set_input("x2");
  return options;
}

MyModel::MyModel(const OptionSet & options)
  : Model(options),
    _y(declare_output_variable<Scalar>("y")),
    _x1(declare_input_variable<Scalar>("x1")),
    _x2(declare_input_variable<Scalar>("x2"))
{
}

void
MyModel::set_value(bool out, bool dout, bool /*d2out*/)
{
  if (out)
    _y = _x1 + _x2;

  if (dout)
  {
    _y.d(_x1) = Scalar::identity_map(_x1.options());
    _y.d(_x2) = Scalar::identity_map(_x2.options());
  }
}
} // namespace neml2
