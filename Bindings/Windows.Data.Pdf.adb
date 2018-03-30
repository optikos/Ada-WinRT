--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI;
with Windows.Storage.Streams;
with Windows.Storage;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.Data.Pdf is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IPdfDocument_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IPdfDocument or riid.all = IID_IUnknown then
         RefCount := This.AddRef;
         pvObject.all := This;
         Hr := S_OK;
      else
         if riid.all = IID_IMarshal or riid.all = IID_IAgileObject then
            if This.m_FTM = null then
               Hr := This.QueryInterface(IID_IUnknown'Access, m_IUnknown'Access);
               Hr := CoCreateFreeThreadedMarshaler(m_IUnknown, This.m_FTM'Address);
            end if;
            Hr := This.m_FTM.QueryInterface(riid, pvObject'Address);
         end if;
      end if;
      return Hr;
   end;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IPdfDocument_Interface
      ; asyncInfo : Windows.Data.Pdf.IAsyncOperation_IPdfDocument
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreatePdfPageRenderOptions return Windows.Data.Pdf.IPdfPageRenderOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfPageRenderOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IPdfPageRenderOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.Data.Pdf.IID_IPdfPageRenderOptions'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   ------------------------------------------------------------------------
   -- Override Implementations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Static procedures/functions
   ------------------------------------------------------------------------
   
   
   function LoadFromFileAsync
   (
      file : Windows.Storage.IStorageFile
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileAsync(file, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromFileWithPasswordAsync
   (
      file : Windows.Storage.IStorageFile
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromFileWithPasswordAsync(file, password, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromStreamAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromStreamAsync(inputStream, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function LoadFromStreamWithPasswordAsync
   (
      inputStream : Windows.Storage.Streams.IRandomAccessStream
      ; password : Windows.String
   )
   return Windows.Data.Pdf.IAsyncOperation_IPdfDocument is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.Data.Pdf.PdfDocument");
      m_Factory     : IPdfDocumentStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Data.Pdf.IAsyncOperation_IPdfDocument;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IPdfDocumentStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.LoadFromStreamWithPasswordAsync(inputStream, password, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
