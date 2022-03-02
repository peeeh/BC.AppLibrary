codeunit 75100 "PVO Attachment Handler"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', true, true)]
    local procedure SalesPost_OnAfterPostSalesDoc(SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20])
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        if SalesInvHdrNo <> '' then begin
            SalesInvoiceHeader.Get(SalesInvHdrNo);
            SalesInvoiceHeader.SetRecFilter();
            SalesInvoiceHeader.PrintToDocumentAttachment(SalesInvoiceHeader);
        end;
        if SalesCrMemoHdrNo <> '' then begin
            SalesCrMemoHeader.get(SalesInvHdrNo);
            SalesCrMemoHeader.SetRecFilter();
            SalesCrMemoHeader.PrintToDocumentAttachment(SalesCrMemoHeader);
        end;
    end;
}