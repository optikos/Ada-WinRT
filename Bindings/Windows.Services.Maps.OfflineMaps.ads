--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.Foundation.Collections;
with Windows.Foundation;
limited with Windows.Devices.Geolocation;
--------------------------------------------------------------------------------
package Windows.Services.Maps.OfflineMaps is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type OfflineMapPackageQueryStatus is (
      Success,
      UnknownError,
      InvalidCredentials,
      NetworkFailure
   );
   for OfflineMapPackageQueryStatus use (
      Success => 0,
      UnknownError => 1,
      InvalidCredentials => 2,
      NetworkFailure => 3
   );
   for OfflineMapPackageQueryStatus'Size use 32;
   
   type OfflineMapPackageQueryStatus_Ptr is access OfflineMapPackageQueryStatus;
   
   type OfflineMapPackageStatus is (
      NotDownloaded,
      Downloading,
      Downloaded,
      Deleting
   );
   for OfflineMapPackageStatus use (
      NotDownloaded => 0,
      Downloading => 1,
      Downloaded => 2,
      Deleting => 3
   );
   for OfflineMapPackageStatus'Size use 32;
   
   type OfflineMapPackageStatus_Ptr is access OfflineMapPackageStatus;
   
   type OfflineMapPackageStartDownloadStatus is (
      Success,
      UnknownError,
      InvalidCredentials,
      DeniedWithoutCapability
   );
   for OfflineMapPackageStartDownloadStatus use (
      Success => 0,
      UnknownError => 1,
      InvalidCredentials => 2,
      DeniedWithoutCapability => 3
   );
   for OfflineMapPackageStartDownloadStatus'Size use 32;
   
   type OfflineMapPackageStartDownloadStatus_Ptr is access OfflineMapPackageStartDownloadStatus;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface;
   type TypedEventHandler_IOfflineMapPackage_add_StatusChanged is access all TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface'Class;
   type TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Ptr is access all TypedEventHandler_IOfflineMapPackage_add_StatusChanged;
   type AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface;
   type AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult is access all AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface'Class;
   type AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Ptr is access all AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult;
   type AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface;
   type AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult is access all AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface'Class;
   type AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Ptr is access all AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IOfflineMapPackageQueryResult_Interface;
   type IOfflineMapPackageQueryResult is access all IOfflineMapPackageQueryResult_Interface'Class;
   type IOfflineMapPackageQueryResult_Ptr is access all IOfflineMapPackageQueryResult;
   type IOfflineMapPackageStartDownloadResult_Interface;
   type IOfflineMapPackageStartDownloadResult is access all IOfflineMapPackageStartDownloadResult_Interface'Class;
   type IOfflineMapPackageStartDownloadResult_Ptr is access all IOfflineMapPackageStartDownloadResult;
   type IOfflineMapPackage_Interface;
   type IOfflineMapPackage is access all IOfflineMapPackage_Interface'Class;
   type IOfflineMapPackage_Ptr is access all IOfflineMapPackage;
   type IOfflineMapPackageStatics_Interface;
   type IOfflineMapPackageStatics is access all IOfflineMapPackageStatics_Interface'Class;
   type IOfflineMapPackageStatics_Ptr is access all IOfflineMapPackageStatics;
   type IIterator_IOfflineMapPackage_Interface;
   type IIterator_IOfflineMapPackage is access all IIterator_IOfflineMapPackage_Interface'Class;
   type IIterator_IOfflineMapPackage_Ptr is access all IIterator_IOfflineMapPackage;
   type IIterable_IOfflineMapPackage_Interface;
   type IIterable_IOfflineMapPackage is access all IIterable_IOfflineMapPackage_Interface'Class;
   type IIterable_IOfflineMapPackage_Ptr is access all IIterable_IOfflineMapPackage;
   type IVectorView_IOfflineMapPackage_Interface;
   type IVectorView_IOfflineMapPackage is access all IVectorView_IOfflineMapPackage_Interface'Class;
   type IVectorView_IOfflineMapPackage_Ptr is access all IVectorView_IOfflineMapPackage;
   type IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface;
   type IAsyncOperation_IOfflineMapPackageStartDownloadResult is access all IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface'Class;
   type IAsyncOperation_IOfflineMapPackageStartDownloadResult_Ptr is access all IAsyncOperation_IOfflineMapPackageStartDownloadResult;
   type IAsyncOperation_IOfflineMapPackageQueryResult_Interface;
   type IAsyncOperation_IOfflineMapPackageQueryResult is access all IAsyncOperation_IOfflineMapPackageQueryResult_Interface'Class;
   type IAsyncOperation_IOfflineMapPackageQueryResult_Ptr is access all IAsyncOperation_IOfflineMapPackageQueryResult;
   
   ------------------------------------------------------------------------
   -- generic packages/types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- generic instantiations
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Interfaces
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type IOfflineMapPackageQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IOfflineMapPackageQueryResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.OfflineMapPackageQueryStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_Packages
   (
      This       : access IOfflineMapPackageQueryResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IVectorView_IOfflineMapPackage -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IOfflineMapPackageQueryResult : aliased constant Windows.IID := (1431852049, 14817, 20033, (164, 225, 95, 72, 114, 190, 225, 153 ));
   
   ------------------------------------------------------------------------
   type IOfflineMapPackageStartDownloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IOfflineMapPackageStartDownloadResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.OfflineMapPackageStartDownloadStatus
   )
   return Windows.HRESULT is abstract;
   
   IID_IOfflineMapPackageStartDownloadResult : aliased constant Windows.IID := (3647322392, 54486, 19198, (147, 120, 62, 199, 30, 241, 28, 61 ));
   
   ------------------------------------------------------------------------
   type IOfflineMapPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Status
   (
      This       : access IOfflineMapPackage_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.OfflineMapPackageStatus
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IOfflineMapPackage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EnclosingRegionName
   (
      This       : access IOfflineMapPackage_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_EstimatedSizeInBytes
   (
      This       : access IOfflineMapPackage_Interface
      ; RetVal : access Windows.UInt64
   )
   return Windows.HRESULT is abstract;
   
   function remove_StatusChanged
   (
      This       : access IOfflineMapPackage_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function add_StatusChanged
   (
      This       : access IOfflineMapPackage_Interface
      ; value : TypedEventHandler_IOfflineMapPackage_add_StatusChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function RequestStartDownloadAsync
   (
      This       : access IOfflineMapPackage_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageStartDownloadResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IOfflineMapPackage : aliased constant Windows.IID := (2811717435, 42421, 16708, (181, 37, 230, 140, 136, 98, 102, 75 ));
   
   ------------------------------------------------------------------------
   type IOfflineMapPackageStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function FindPackagesAsync
   (
      This       : access IOfflineMapPackageStatics_Interface
      ; queryPoint : Windows.Devices.Geolocation.IGeopoint
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesInBoundingBoxAsync
   (
      This       : access IOfflineMapPackageStatics_Interface
      ; queryBoundingBox : Windows.Devices.Geolocation.IGeoboundingBox
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindPackagesInGeocircleAsync
   (
      This       : access IOfflineMapPackageStatics_Interface
      ; queryCircle : Windows.Devices.Geolocation.IGeocircle
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IOfflineMapPackageStatics : aliased constant Windows.IID := (408844578, 43057, 19120, (148, 31, 105, 152, 250, 146, 146, 133 ));
   
   ------------------------------------------------------------------------
   type IIterator_IOfflineMapPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Current
   (
      This       : access IIterator_IOfflineMapPackage_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IOfflineMapPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_HasCurrent
   (
      This       : access IIterator_IOfflineMapPackage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function MoveNext
   (
      This       : access IIterator_IOfflineMapPackage_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IIterator_IOfflineMapPackage_Interface
      ; items : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterator_IOfflineMapPackage : aliased constant Windows.IID := (1963937079, 14182, 22594, (164, 37, 204, 217, 184, 216, 7, 134 ));
   
   ------------------------------------------------------------------------
   type IIterable_IOfflineMapPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function First
   (
      This       : access IIterable_IOfflineMapPackage_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IIterator_IOfflineMapPackage
   )
   return Windows.HRESULT is abstract;
   
   IID_IIterable_IOfflineMapPackage : aliased constant Windows.IID := (1965172860, 2802, 22636, (187, 63, 69, 124, 7, 152, 74, 111 ));
   
   ------------------------------------------------------------------------
   type IVectorView_IOfflineMapPackage_Interface is interface and Windows.IInspectable_Interface;
   
   function GetAt
   (
      This       : access IVectorView_IOfflineMapPackage_Interface
      ; index : Windows.UInt32
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IOfflineMapPackage
   )
   return Windows.HRESULT is abstract;
   
   function get_Size
   (
      This       : access IVectorView_IOfflineMapPackage_Interface
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   function IndexOf
   (
      This       : access IVectorView_IOfflineMapPackage_Interface
      ; value : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage
      ; index : access Windows.UInt32
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function GetMany
   (
      This       : access IVectorView_IOfflineMapPackage_Interface
      ; startIndex : Windows.UInt32
      ; items : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage_Ptr
      ; RetVal : access Windows.UInt32
   )
   return Windows.HRESULT is abstract;
   
   IID_IVectorView_IOfflineMapPackage : aliased constant Windows.IID := (623045570, 48543, 21787, (185, 14, 108, 40, 21, 41, 88, 160 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface
      ; handler : Windows.Services.Maps.OfflineMaps.AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOfflineMapPackageStartDownloadResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IOfflineMapPackageStartDownloadResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IOfflineMapPackageStartDownloadResult : aliased constant Windows.IID := (2433905399, 62890, 21395, (148, 161, 233, 106, 223, 173, 61, 164 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IOfflineMapPackageQueryResult_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IOfflineMapPackageQueryResult_Interface
      ; handler : Windows.Services.Maps.OfflineMaps.AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IOfflineMapPackageQueryResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IOfflineMapPackageQueryResult_Interface
      ; RetVal : access Windows.Services.Maps.OfflineMaps.IOfflineMapPackageQueryResult
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IOfflineMapPackageQueryResult : aliased constant Windows.IID := (3222955581, 28059, 21381, (174, 104, 10, 101, 169, 84, 69, 20 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface(Callback : access procedure (sender : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage ; args : Windows.Object)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IOfflineMapPackage_add_StatusChanged_Interface
      ; sender : Windows.Services.Maps.OfflineMaps.IOfflineMapPackage
      ; args : Windows.Object
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IOfflineMapPackage_add_StatusChanged : aliased constant Windows.IID := (757992736, 33391, 22028, (177, 193, 180, 189, 111, 191, 50, 154 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageStartDownloadResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult_Interface
      ; asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageStartDownloadResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IOfflineMapPackageStartDownloadResult : aliased constant Windows.IID := (2253694878, 50479, 24472, (175, 10, 82, 36, 102, 194, 114, 70 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface(Callback : access procedure (asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult_Interface
      ; asyncInfo : Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IOfflineMapPackageQueryResult : aliased constant Windows.IID := (2320364489, 9621, 23532, (139, 161, 193, 217, 85, 241, 104, 192 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype OfflineMapPackage is Windows.Services.Maps.OfflineMaps.IOfflineMapPackage;
   subtype OfflineMapPackageStartDownloadResult is Windows.Services.Maps.OfflineMaps.IOfflineMapPackageStartDownloadResult;
   subtype OfflineMapPackageQueryResult is Windows.Services.Maps.OfflineMaps.IOfflineMapPackageQueryResult;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function FindPackagesAsync
   (
      queryPoint : Windows.Devices.Geolocation.IGeopoint
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;
   
   function FindPackagesInBoundingBoxAsync
   (
      queryBoundingBox : Windows.Devices.Geolocation.IGeoboundingBox
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;
   
   function FindPackagesInGeocircleAsync
   (
      queryCircle : Windows.Devices.Geolocation.IGeocircle
   )
   return Windows.Services.Maps.OfflineMaps.IAsyncOperation_IOfflineMapPackageQueryResult;

end;
