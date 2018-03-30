--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
limited with Windows.Storage.Streams;
with Windows.Foundation;
with Windows.Foundation.Collections;
limited with Windows.ApplicationModel.Appointments;
limited with Windows.ApplicationModel.Email;
limited with Windows.ApplicationModel.Contacts;
limited with Windows.ApplicationModel.UserDataTasks;
limited with Windows.System;
--------------------------------------------------------------------------------
package Windows.ApplicationModel.UserDataAccounts is

   pragma preelaborate;
   
   ------------------------------------------------------------------------
   -- Enums
   ------------------------------------------------------------------------
   
   type UserDataAccountOtherAppReadAccess is (
      SystemOnly,
      Full,
      None
   );
   for UserDataAccountOtherAppReadAccess use (
      SystemOnly => 0,
      Full => 1,
      None => 2
   );
   for UserDataAccountOtherAppReadAccess'Size use 32;
   
   type UserDataAccountOtherAppReadAccess_Ptr is access UserDataAccountOtherAppReadAccess;
   
   type UserDataAccountStoreAccessType is (
      AllAccountsReadOnly,
      AppAccountsReadWrite
   );
   for UserDataAccountStoreAccessType use (
      AllAccountsReadOnly => 0,
      AppAccountsReadWrite => 1
   );
   for UserDataAccountStoreAccessType'Size use 32;
   
   type UserDataAccountStoreAccessType_Ptr is access UserDataAccountStoreAccessType;
   
   type UserDataAccountContentKinds is (
      Email,
      Contact,
      Appointment
   );
   for UserDataAccountContentKinds use (
      Email => 1,
      Contact => 2,
      Appointment => 4
   );
   for UserDataAccountContentKinds'Size use 32;
   
   type UserDataAccountContentKinds_Ptr is access UserDataAccountContentKinds;
   
   ------------------------------------------------------------------------
   -- Record types
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Delegates/Events
   ------------------------------------------------------------------------
   
   type AsyncOperationCompletedHandler_IUserDataAccount_Interface;
   type AsyncOperationCompletedHandler_IUserDataAccount is access all AsyncOperationCompletedHandler_IUserDataAccount_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataAccount_Ptr is access all AsyncOperationCompletedHandler_IUserDataAccount;
   type TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Interface;
   type TypedEventHandler_IUserDataAccountStore2_add_StoreChanged is access all TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Interface'Class;
   type TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Ptr is access all TypedEventHandler_IUserDataAccountStore2_add_StoreChanged;
   type AsyncOperationCompletedHandler_IUserDataAccountStore_Interface;
   type AsyncOperationCompletedHandler_IUserDataAccountStore is access all AsyncOperationCompletedHandler_IUserDataAccountStore_Interface'Class;
   type AsyncOperationCompletedHandler_IUserDataAccountStore_Ptr is access all AsyncOperationCompletedHandler_IUserDataAccountStore;
   
   ------------------------------------------------------------------------
   -- Forward Declaration - Interfaces
   ------------------------------------------------------------------------
   
   type IUserDataAccount_Interface;
   type IUserDataAccount is access all IUserDataAccount_Interface'Class;
   type IUserDataAccount_Ptr is access all IUserDataAccount;
   type IUserDataAccount2_Interface;
   type IUserDataAccount2 is access all IUserDataAccount2_Interface'Class;
   type IUserDataAccount2_Ptr is access all IUserDataAccount2;
   type IUserDataAccount3_Interface;
   type IUserDataAccount3 is access all IUserDataAccount3_Interface'Class;
   type IUserDataAccount3_Ptr is access all IUserDataAccount3;
   type IUserDataAccount4_Interface;
   type IUserDataAccount4 is access all IUserDataAccount4_Interface'Class;
   type IUserDataAccount4_Ptr is access all IUserDataAccount4;
   type IUserDataAccountStore_Interface;
   type IUserDataAccountStore is access all IUserDataAccountStore_Interface'Class;
   type IUserDataAccountStore_Ptr is access all IUserDataAccountStore;
   type IUserDataAccountStore2_Interface;
   type IUserDataAccountStore2 is access all IUserDataAccountStore2_Interface'Class;
   type IUserDataAccountStore2_Ptr is access all IUserDataAccountStore2;
   type IUserDataAccountStore3_Interface;
   type IUserDataAccountStore3 is access all IUserDataAccountStore3_Interface'Class;
   type IUserDataAccountStore3_Ptr is access all IUserDataAccountStore3;
   type IUserDataAccountManagerStatics_Interface;
   type IUserDataAccountManagerStatics is access all IUserDataAccountManagerStatics_Interface'Class;
   type IUserDataAccountManagerStatics_Ptr is access all IUserDataAccountManagerStatics;
   type IUserDataAccountManagerStatics2_Interface;
   type IUserDataAccountManagerStatics2 is access all IUserDataAccountManagerStatics2_Interface'Class;
   type IUserDataAccountManagerStatics2_Ptr is access all IUserDataAccountManagerStatics2;
   type IUserDataAccountManagerForUser_Interface;
   type IUserDataAccountManagerForUser is access all IUserDataAccountManagerForUser_Interface'Class;
   type IUserDataAccountManagerForUser_Ptr is access all IUserDataAccountManagerForUser;
   type IUserDataAccountStoreChangedEventArgs_Interface;
   type IUserDataAccountStoreChangedEventArgs is access all IUserDataAccountStoreChangedEventArgs_Interface'Class;
   type IUserDataAccountStoreChangedEventArgs_Ptr is access all IUserDataAccountStoreChangedEventArgs;
   type IAsyncOperation_IUserDataAccount_Interface;
   type IAsyncOperation_IUserDataAccount is access all IAsyncOperation_IUserDataAccount_Interface'Class;
   type IAsyncOperation_IUserDataAccount_Ptr is access all IAsyncOperation_IUserDataAccount;
   type IAsyncOperation_IUserDataAccountStore_Interface;
   type IAsyncOperation_IUserDataAccountStore is access all IAsyncOperation_IUserDataAccountStore_Interface'Class;
   type IAsyncOperation_IUserDataAccountStore_Ptr is access all IAsyncOperation_IUserDataAccountStore;
   
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
   type IUserDataAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function get_Id
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_UserDisplayName
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_UserDisplayName
   (
      This       : access IUserDataAccount_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_OtherAppReadAccess
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.UserDataAccountOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function put_OtherAppReadAccess
   (
      This       : access IUserDataAccount_Interface
      ; value : Windows.ApplicationModel.UserDataAccounts.UserDataAccountOtherAppReadAccess
   )
   return Windows.HRESULT is abstract;
   
   function get_Icon
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   function get_DeviceAccountTypeId
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_PackageFamilyName
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function SaveAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function DeleteAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function FindAppointmentCalendarsAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindEmailMailboxesAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindContactListsAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindContactAnnotationListsAsync
   (
      This       : access IUserDataAccount_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccount : aliased constant Windows.IID := (3116643966, 45896, 18704, (190, 148, 74, 212, 187, 166, 222, 167 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccount2_Interface is interface and Windows.IInspectable_Interface;
   
   function get_EnterpriseId
   (
      This       : access IUserDataAccount2_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function get_IsProtectedUnderLock
   (
      This       : access IUserDataAccount2_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccount2 : aliased constant Windows.IID := (126671007, 56962, 16459, (129, 149, 200, 163, 172, 25, 143, 96 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccount3_Interface is interface and Windows.IInspectable_Interface;
   
   function get_ExplictReadAccessPackageFamilyNames
   (
      This       : access IUserDataAccount3_Interface
      ; RetVal : access Windows.Foundation.Collections.IVector_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_DisplayName
   (
      This       : access IUserDataAccount3_Interface
      ; RetVal : access Windows.String
   )
   return Windows.HRESULT is abstract;
   
   function put_DisplayName
   (
      This       : access IUserDataAccount3_Interface
      ; value : Windows.String
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccount3 : aliased constant Windows.IID := (22231109, 27715, 17030, (157, 105, 62, 23, 9, 161, 242, 102 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccount4_Interface is interface and Windows.IInspectable_Interface;
   
   function get_CanShowCreateContactGroup
   (
      This       : access IUserDataAccount4_Interface
      ; RetVal : access Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_CanShowCreateContactGroup
   (
      This       : access IUserDataAccount4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function get_ProviderProperties
   (
      This       : access IUserDataAccount4_Interface
      ; RetVal : access Windows.Foundation.Collections.IPropertySet
   )
   return Windows.HRESULT is abstract;
   
   function FindUserDataTaskListsAsync
   (
      This       : access IUserDataAccount4_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function FindContactGroupsAsync
   (
      This       : access IUserDataAccount4_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function TryShowCreateContactGroupAsync
   (
      This       : access IUserDataAccount4_Interface
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function put_IsProtectedUnderLock
   (
      This       : access IUserDataAccount4_Interface
      ; value : Windows.Boolean
   )
   return Windows.HRESULT is abstract;
   
   function put_Icon
   (
      This       : access IUserDataAccount4_Interface
      ; value : Windows.Storage.Streams.IRandomAccessStreamReference
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccount4 : aliased constant Windows.IID := (3291566608, 60133, 20234, (168, 178, 28, 202, 17, 94, 0, 143 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountStore_Interface is interface and Windows.IInspectable_Interface;
   
   function FindAccountsAsync
   (
      This       : access IUserDataAccountStore_Interface
      ; RetVal : access Windows.Address -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function GetAccountAsync
   (
      This       : access IUserDataAccountStore_Interface
      ; id : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function CreateAccountAsync
   (
      This       : access IUserDataAccountStore_Interface
      ; userDisplayName : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountStore : aliased constant Windows.IID := (544452781, 32010, 20086, (191, 69, 35, 104, 249, 120, 165, 154 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountStore2_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAccountWithPackageRelativeAppIdAsync
   (
      This       : access IUserDataAccountStore2_Interface
      ; userDisplayName : Windows.String
      ; packageRelativeAppId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function add_StoreChanged
   (
      This       : access IUserDataAccountStore2_Interface
      ; handler : TypedEventHandler_IUserDataAccountStore2_add_StoreChanged
      ; RetVal : access Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   function remove_StoreChanged
   (
      This       : access IUserDataAccountStore2_Interface
      ; token : Windows.Foundation.EventRegistrationToken
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountStore2 : aliased constant Windows.IID := (2984292087, 38240, 17969, (138, 240, 6, 29, 48, 22, 20, 105 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountStore3_Interface is interface and Windows.IInspectable_Interface;
   
   function CreateAccountWithPackageRelativeAppIdAndEnterpriseIdAsync
   (
      This       : access IUserDataAccountStore3_Interface
      ; userDisplayName : Windows.String
      ; packageRelativeAppId : Windows.String
      ; enterpriseId : Windows.String
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountStore3 : aliased constant Windows.IID := (2168635540, 62409, 18315, (177, 23, 101, 133, 190, 187, 103, 137 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountManagerStatics_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IUserDataAccountManagerStatics_Interface
      ; storeAccessType : Windows.ApplicationModel.UserDataAccounts.UserDataAccountStoreAccessType
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccountStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAddAccountAsync
   (
      This       : access IUserDataAccountManagerStatics_Interface
      ; contentKinds : Windows.ApplicationModel.UserDataAccounts.UserDataAccountContentKinds
      ; RetVal : access Windows.Foundation.IAsyncOperation_String -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function ShowAccountSettingsAsync
   (
      This       : access IUserDataAccountManagerStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   function ShowAccountErrorResolverAsync
   (
      This       : access IUserDataAccountManagerStatics_Interface
      ; id : Windows.String
      ; RetVal : access Windows.Foundation.IAsyncAction
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountManagerStatics : aliased constant Windows.IID := (228297194, 6440, 18976, (134, 213, 60, 115, 127, 125, 195, 176 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountManagerStatics2_Interface is interface and Windows.IInspectable_Interface;
   
   function GetForUser
   (
      This       : access IUserDataAccountManagerStatics2_Interface
      ; user : Windows.System.IUser
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IUserDataAccountManagerForUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountManagerStatics2 : aliased constant Windows.IID := (1782443400, 12651, 17246, (181, 52, 247, 212, 180, 183, 219, 166 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountManagerForUser_Interface is interface and Windows.IInspectable_Interface;
   
   function RequestStoreAsync
   (
      This       : access IUserDataAccountManagerForUser_Interface
      ; storeAccessType : Windows.ApplicationModel.UserDataAccounts.UserDataAccountStoreAccessType
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccountStore -- Generic Parameter Type
   )
   return Windows.HRESULT is abstract;
   
   function get_User
   (
      This       : access IUserDataAccountManagerForUser_Interface
      ; RetVal : access Windows.System.IUser
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountManagerForUser : aliased constant Windows.IID := (1453779163, 56207, 16811, (166, 95, 140, 89, 113, 170, 201, 130 ));
   
   ------------------------------------------------------------------------
   type IUserDataAccountStoreChangedEventArgs_Interface is interface and Windows.IInspectable_Interface;
   
   function GetDeferral
   (
      This       : access IUserDataAccountStoreChangedEventArgs_Interface
      ; RetVal : access Windows.Foundation.IDeferral
   )
   return Windows.HRESULT is abstract;
   
   IID_IUserDataAccountStoreChangedEventArgs : aliased constant Windows.IID := (2229527269, 34848, 17682, (177, 246, 46, 3, 91, 225, 7, 44 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IUserDataAccount_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataAccount_Interface
      ; handler : Windows.ApplicationModel.UserDataAccounts.AsyncOperationCompletedHandler_IUserDataAccount
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataAccount_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.AsyncOperationCompletedHandler_IUserDataAccount
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataAccount_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IUserDataAccount
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IUserDataAccount : aliased constant Windows.IID := (4037980847, 42651, 23722, (162, 131, 50, 230, 151, 166, 93, 49 ));
   
   ------------------------------------------------------------------------
   type IAsyncOperation_IUserDataAccountStore_Interface is interface and Windows.IInspectable_Interface;
   
   function put_Completed
   (
      This       : access IAsyncOperation_IUserDataAccountStore_Interface
      ; handler : Windows.ApplicationModel.UserDataAccounts.AsyncOperationCompletedHandler_IUserDataAccountStore
   )
   return Windows.HRESULT is abstract;
   
   function get_Completed
   (
      This       : access IAsyncOperation_IUserDataAccountStore_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.AsyncOperationCompletedHandler_IUserDataAccountStore
   )
   return Windows.HRESULT is abstract;
   
   function GetResults
   (
      This       : access IAsyncOperation_IUserDataAccountStore_Interface
      ; RetVal : access Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStore
   )
   return Windows.HRESULT is abstract;
   
   IID_IAsyncOperation_IUserDataAccountStore : aliased constant Windows.IID := (112627486, 39223, 21142, (165, 94, 212, 61, 216, 167, 84, 92 ));
   
   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUserDataAccount_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUserDataAccount_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataAccount_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccount
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUserDataAccount : aliased constant Windows.IID := (2878530598, 10950, 24571, (136, 202, 203, 221, 145, 223, 57, 39 ));
   
   ------------------------------------------------------------------------
   type TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Interface(Callback : access procedure (sender : Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStore ; args : Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStoreChangedEventArgs)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access TypedEventHandler_IUserDataAccountStore2_add_StoreChanged_Interface
      ; sender : Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStore
      ; args : Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStoreChangedEventArgs
   )
   return Windows.HRESULT;
   
   IID_TypedEventHandler_IUserDataAccountStore2_add_StoreChanged : aliased constant Windows.IID := (2066198216, 1680, 20579, (190, 176, 217, 226, 235, 26, 18, 1 ));
   
   ------------------------------------------------------------------------
   type AsyncOperationCompletedHandler_IUserDataAccountStore_Interface(Callback : access procedure (asyncInfo : Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccountStore ; asyncStatus : Windows.Foundation.AsyncStatus)) is new Windows.IMulticastDelegate_Interface with null record;
   
   function QueryInterface(This :  access AsyncOperationCompletedHandler_IUserDataAccountStore_Interface ; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT;
   
   function Invoke
   (
      This       : access AsyncOperationCompletedHandler_IUserDataAccountStore_Interface
      ; asyncInfo : Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccountStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT;
   
   IID_AsyncOperationCompletedHandler_IUserDataAccountStore : aliased constant Windows.IID := (642526377, 10676, 20533, (180, 96, 140, 141, 14, 143, 188, 217 ));
   
   ------------------------------------------------------------------------
   -- Classes
   ------------------------------------------------------------------------
   
   subtype UserDataAccount is Windows.ApplicationModel.UserDataAccounts.IUserDataAccount;
   subtype UserDataAccountStore is Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStore;
   subtype UserDataAccountStoreChangedEventArgs is Windows.ApplicationModel.UserDataAccounts.IUserDataAccountStoreChangedEventArgs;
   subtype UserDataAccountManagerForUser is Windows.ApplicationModel.UserDataAccounts.IUserDataAccountManagerForUser;
   
   ------------------------------------------------------------------------
   -- Static Procedures/functions
   ------------------------------------------------------------------------
   
   
   function RequestStoreAsync
   (
      storeAccessType : Windows.ApplicationModel.UserDataAccounts.UserDataAccountStoreAccessType
   )
   return Windows.ApplicationModel.UserDataAccounts.IAsyncOperation_IUserDataAccountStore;
   
   function ShowAddAccountAsync
   (
      contentKinds : Windows.ApplicationModel.UserDataAccounts.UserDataAccountContentKinds
   )
   return Windows.Foundation.IAsyncOperation_String;
   
   function ShowAccountSettingsAsync
   (
      id : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function ShowAccountErrorResolverAsync
   (
      id : Windows.String
   )
   return Windows.Foundation.IAsyncAction;
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.UserDataAccounts.IUserDataAccountManagerForUser;

end;
