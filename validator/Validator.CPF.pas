unit Validator.CPF;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Utils.Common;

type

  { TCPF }
  TCPF = object
  strict private
    FCPF: string;
  public
    function IsCPF(const AValue: string): boolean; static;
    property CPF: string read FCPF write FCPF;
  end;

implementation

{ TCPF }

function TCPF.IsCPF(const AValue: string): boolean; static;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  d1, d2: integer;
  digitado, calculado, num: string;
begin
  num := TUtils.GetOnlyNumber(AValue);
  if (Length(num) <> 11) then
  begin
    Result := False;
  end
  else
  begin
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 *
      8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 *
      8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := IntToStr(d1) + IntToStr(d2);
    digitado := num[10] + num[11];
    if calculado = digitado then
      Result := True
    else
      Result := False;
  end;
end;

end.
