# DfRestApi
Library for use Rest Api in Delphi
In addition to Get and Post, this library now includes Put, Delete, and Patch methods for making REST requests. The Put method sends a JSON request body with a PUT request, the Delete method sends a DELETE request, and the Patch method sends a JSON request body with a PATCH request.
Note that the Delete method returns a Boolean value indicating whether the request was successful or not. This is because the Indy HTTP client raises an exception if the server returns a non-2xx status code, and we want to handle this gracefully in our code.

GET request:
```pascal
var
  Rest: DFRestLibrary;
  Response: TJSONObject;
begin
  Rest := DFRestLibrary.Create;
  try
    Response := Rest.Get('https://jsonplaceholder.typicode.com/posts/1');
    try
      // Do something with the response
    finally
      Response.Free;
    end;
  finally
    Rest.Free;
  end;
end;

```


This code sends a GET request to the JSONPlaceholder API to retrieve a post with ID 1. The response is returned as a TJSONObject which you can then use in your application.

POST request:
```pascal
var
  Rest: DFRestLibrary;
  Request, Response: TJSONObject;
begin
  Rest := DFRestLibrary.Create;
  try
    Request := TJSONObject.Create;
    try
      Request.AddPair('title', 'foo');
      Request.AddPair('body', 'bar');
      Request.AddPair('userId', '1');
      Response := Rest.Post('https://jsonplaceholder.typicode.com/posts', Request);
      try
        // Do something with the response
      finally
        Response.Free;
      end;
    finally
      Request.Free;
    end;
  finally
    Rest.Free;
  end;
end;
```

This code sends a POST request to the JSONPlaceholder API to create a new post. The request body is a TJSONObject containing the post title, body, and user ID. The response is returned as a TJSONObject which you can then use in your application.

PUT request:
```pascal
var
  Rest: DFRestLibrary;
  Request, Response: TJSONObject;
begin
  Rest := DFRestLibrary.Create;
  try
    Request := TJSONObject.Create;
    try
      Request.AddPair('title', 'foo');
      Request.AddPair('body', 'bar');
      Request.AddPair('userId', '1');
      Response := Rest.Put('https://jsonplaceholder.typicode.com/posts/1', Request);
      try
        // Do something with the response
      finally
        Response.Free;
      end;
    finally
      Request.Free;
    end;
  finally
    Rest.Free;
  end;
end; 
```

This code sends a PUT request to the JSONPlaceholder API to update an existing post with ID 1. The request body is a TJSONObject containing the updated post title, body, and user ID. The response is returned as a TJSONObject which you can then use in your application.

DELETE request:
```pascal
var
  Rest: DFRestLibrary;
  Success: Boolean;
begin
  Rest := DFRestLibrary.Create;
  try
    Success := Rest.Delete('https://jsonplaceholder.typicode.com/posts/1');
    if Success then
    begin
      // Do something if the request was successful
    end
    else
    begin
      // Do something if the request failed
    end;
  finally
    Rest.Free;
  end;
end;
```

This code sends a DELETE request to the JSONPlaceholder API to delete an existing post with ID 1. The Delete method returns a Boolean value indicating whether the request was successful or not. You can use this value to handle the response in your application.
