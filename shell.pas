program ShellSort;

procedure Sort(var arr: array of Integer; size: Integer);
var
  gap, i, j, tmp: Integer;
begin
  gap := size div 2;
  while gap > 0 do
  begin
    for i := gap to size - 1 do
    begin
      tmp := arr[i];
      j := i;

      while (j >= gap) and (arr[j - gap] > tmp) do
      begin
        arr[j] := arr[j - gap];
        j := j - gap;
      end;

      arr[j] := tmp;
    end;

    gap := gap div 2;
  end;
end;

var
  arr: array[0..5] of Integer = (12, 11, 13, 5, 6, 7);
  size, i: Integer;
begin
  size := length(arr);

  Sort(arr, size);

  for i := 0 to size - 1 do
    Write(arr[i], ' ');
end.