defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    Enum.count(l)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    Enum.reverse(l)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    Enum.map(l, f)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    Enum.filter(l,f)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    Enum.reduce(l, acc, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    List.flatten [a|b]
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    List.flatten(ll)
  end
end
