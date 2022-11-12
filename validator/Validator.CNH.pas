unit Validator.CNH;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TCNH }
  TCNH = object
  strict private
    FCNH: string;
  public
    function IsCNH(AValue: string): boolean; static;
    property CNH: string read FCNH write FCNH;
  end;

implementation

{ TCNH }

function TCNH.IsCNH(AValue: string): boolean; static;
const
  String1 = '987654321';
  String2 = '123456789';
var
  i, j, Digito: shortint;
  Controle, DigitoInformado: string[2];
  StringX: string;
  Soma, Decr: smallint;
begin
  AValue := Copy('00000000000' + Trim(AValue), (Length(Trim(AValue)) + 11) - 10, 11);

  Controle := '  ';
  DigitoInformado := Copy(AValue, 10, 2);
  StringX := String1;
  Decr := 0;

  if AValue <> '00000000000' then
    for i := 1 to 2 do
    begin
      Soma := 0;
      if i = 2 then StringX := String2;
      for j := 1 to 9 do
        Soma := Soma + (StrToInt(AValue[j]) * StrToIntDef(StringX[j], 0));
      Digito := Soma mod 11;
      if Digito >= 10 then
      begin
        Digito := 0;
        if i = 1 then
          Decr := 2;
      end;
      if i = 2 then
        Digito := Digito - Decr;
      Controle[i] := IntToStr(Digito)[1];
    end;

  Result := Controle = DigitoInformado;
end;

end.
