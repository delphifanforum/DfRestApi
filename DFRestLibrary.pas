unit DFRestLibrary;

interface

uses
  System.SysUtils, System.Classes, System.JSON, IdHTTP;

type
  DFRestLibrary = class
  private
    FHTTP: TIdHTTP;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const AURL: string): TJSONObject;
    function Post(const AURL: string; const ARequest: TJSONObject): TJSONObject;
    function Put(const AURL: string; const ARequest: TJSONObject): TJSONObject;
    function Delete(const AURL: string): Boolean;
    function Patch(const AURL: string; const ARequest: TJSONObject): TJSONObject;
  end;

implementation

constructor DFRestLibrary.Create;
begin
  FHTTP := TIdHTTP.Create(nil);
end;

destructor DFRestLibrary.Destroy;
begin
  FHTTP.Free;
  inherited;
end;

function DFRestLibrary.Get(const AURL: string): TJSONObject;
var
  Response: string;
begin
  Response := FHTTP.Get(AURL);
  Result :=JSONObject.ParseJSONValue(Response) as TJSONObject;
end;

function DFRestLibrary.Post(const AURL: string; const ARequest: TJSONObject): TJSONObject;
var
  RequestBody: TStringStream;
  Response: string;
begin
  RequestBody := TStringStream.Create(ARequest.ToString, TEncoding.UTF8);
  try
    Response := FHTTP.Post(AURL, RequestBody);
    Result := TJSONObject.ParseJSONValue(Response) as TJSONObject;
  finally
    RequestBody.Free;
  end;
end;

function DFRestLibrary.Put(const AURL: string; const ARequest: TJSONObject): TJSONObject;
var
  RequestBody: TStringStream;
  Response: string;
begin
  RequestBody := TStringStream.Create(ARequest.ToString, TEncoding.UTF8);
  try
    Response := FHTTP.Put(AURL, RequestBody);
    Result := TJSONObject.ParseJSONValue(Response) as TJSONObject;
  finally
    RequestBody.Free;
  end;
end;

function DFRestLibrary.Delete(const AURL: string): Boolean;
begin
  try
    FHTTP.Delete(AURL);
    Result := True;
  except
    Result := False;
  end;
end;

function DFRestLibrary.Patch(const AURL: string; const ARequest: TJSONObject): TJSONObject;
var
  RequestBody: TStringStream;
  Response: string;
begin
  RequestBody := TStringStream.Create(ARequest.ToString, TEncoding.UTF8);
  try
    Response := FHTTP.CustomRequest('PATCH', AURL, RequestBody);
    Result := TJSONObject.ParseJSONValue(Response) as TJSONObject;
  finally
    RequestBody.Free;
  end;
end;

end.
