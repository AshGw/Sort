program RadixSort;

const
  MAX_DIGITS = 10;

type
  TAB = array of Integer;

procedure CountUp(var arr: TAB; n, exp: Integer);
var
  output: TAB;
  count: array[0..9] of Integer;
  i: Integer;
begin
  setlength(output, n);
  fillchar(count, sizeof(count), 0);

  for i := 0 to n - 1 do
    (count[(arr[i] div exp) mod 10])+=1;

  for i := 1 to 9 do
    count[i] := count[i] + count[i - 1];

  for i := n - 1 downto 0 do
  begin
    output[count[(arr[i] div exp) mod 10] - 1] := arr[i];
    (count[(arr[i] div exp) mod 10])-=1;
  end;

  for i := 0 to n - 1 do
    arr[i] := output[i];
end;

procedure Sort(var arr: TAB);
var
  max, exp, n, i: Integer;
begin
  n := Length(arr);
  max := arr[0];
  for i := 1 to n - 1 do
    if arr[i] > max then
      max := arr[i];

  exp := 1;
  while max div exp > 0 do
  begin
    CountUp(arr, n, exp);
    exp := exp * 10;
  end;
end;

procedure PrintOut(const arr: TAB);
var
  i: Integer;
begin
  for i := 0 to Length(arr) - 1 do
    Write(arr[i], ' ');
  Writeln;
end;

var
  arr: TAB;
begin
  arr := [170, 45, 75, 90, 802, 24, 2, 66];
  
  PrintOut(arr);
  Sort(arr);
  PrintOut(arr);
end.