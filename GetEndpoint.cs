namespace HelloWorld;

using FastEndpoints;

public class GetEndpoint : Endpoint<MyResponse>
{
    public override void Configure()
    {
        Get("/");
        AllowAnonymous();
    }

    public override async Task HandleAsync(MyResponse req, CancellationToken ct)
    {
        await SendAsync(new MyResponse()
        {
            FullName = "Hello World",
            IsOver18 = false
        }, cancellation: ct);
    }
}