program HeapSort;

procedure heap_it(var arr: array of Integer; size, root: Integer);
var
  largest, left, right: Integer;
begin
  largest := root;
  left := 2 * root + 1;
  right := 2 * root + 2;

  if (left < size) and (arr[left] > arr[largest]) then
    largest := left;

  if (right < size) and (arr[right] > arr[largest]) then
    largest := right;

  if largest <> root then
  begin
    arr[root] := arr[root] + arr[largest];
    arr[largest] := arr[root] - arr[largest];
    arr[root] := arr[root] - arr[largest];

    heap_it(arr, size, largest);
  end;
end;

procedure Sort(var arr: array of Integer; size: Integer);
var
  i: Integer;
begin
  for i := (size div 2) - 1 downto 0 do
    heap_it(arr, size, i);

  for i := size - 1 downto 1 do
  begin
    arr[0] := arr[0] + arr[i];
    arr[i] := arr[0] - arr[i];
    arr[0] := arr[0] - arr[i];

    heap_it(arr, i, 0);
  end;
end;

var
  arr: array[0..9] of Integer = (12, 11, 13, 5, 6, 7, 1, 2, 3, 4);
  size, i: Integer;
begin
  size := length(arr);

  Sort(arr, size);

  for i := 0 to size - 1 do
    Write(arr[i], ' ');
end.