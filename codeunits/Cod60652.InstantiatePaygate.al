codeunit 60652 "Instantiate Paygate"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    begin
        CreateWebserice();
    end;

    trigger OnRun()
    begin
        CreateWebserice();
    end;

    local procedure CreateWebserice()
    var
        WebSericeAgg: Record "Web Service Aggregate";
        ServiceName: Label 'PaygateInterManager';
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        if WebSericeAgg.Get(WebSericeAgg."Object Type"::Codeunit, ServiceName) then
            exit;
        WebServiceManagement.CreateTenantWebService(WebSericeAgg."Object Type"::Codeunit, Codeunit::"Paygate Intergration Manager", ServiceName, true);
    end;
}
