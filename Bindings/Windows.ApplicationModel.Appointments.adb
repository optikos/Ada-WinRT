--------------------------------------------------------------------------------
--    Copywrite : 2018 - Alexander Gamper                                     --
--    Version   : 0.1.0.0                                                     --
--------------------------------------------------------------------------------
with Windows.UI.Popups;
with Windows.System;
with Windows.UI;
with Ada.Unchecked_Conversion;
--------------------------------------------------------------------------------
package body Windows.ApplicationModel.Appointments is

   ------------------------------------------------------------------------
   -- Delegates/Events
   ------------------------------------------------------------------------
   
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IAppointmentStore_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IAppointmentStore or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IAppointmentStore_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IAppointment_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IAppointment or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IAppointment_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointment
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppointmentCalendarSyncManager_add_SyncStatusChanged_Interface
      ; sender : Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager
      ; args : Windows.Object
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.IAppointmentCalendarSyncManager(sender), args);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IAppointmentCalendar_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IAppointmentCalendar or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IAppointmentCalendar_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentCalendar
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_AsyncOperationCompletedHandler_IAppointmentConflictResult or riid.all = IID_IUnknown then
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
      This       : access AsyncOperationCompletedHandler_IAppointmentConflictResult_Interface
      ; asyncInfo : Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentConflictResult
      ; asyncStatus : Windows.Foundation.AsyncStatus
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(asyncInfo, asyncStatus);
      return Hr;
   end;
   
   function QueryInterface(This : access TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface; riid : in Windows.GUID_Ptr ; pvObject : access IUnknown_Base) return Windows.HRESULT is
      Hr : Windows.HResult := E_NOTIMPL;
      m_IUnknown : aliased Windows.IUnknown_Base;
      RefCount   : Windows.UInt32;
      pragma suppress(all_checks);
   begin
      if riid.all = IID_TypedEventHandler_IAppointmentStore2_add_StoreChanged or riid.all = IID_IUnknown then
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
      This       : access TypedEventHandler_IAppointmentStore2_add_StoreChanged_Interface
      ; sender : Windows.ApplicationModel.Appointments.IAppointmentStore
      ; args : Windows.ApplicationModel.Appointments.IAppointmentStoreChangedEventArgs
   )
   return Windows.HRESULT is
      Hr : Windows.HRESULT := S_OK;
   begin
      This.Callback(Windows.ApplicationModel.Appointments.IAppointmentStore(sender), Windows.ApplicationModel.Appointments.IAppointmentStoreChangedEventArgs(args));
      return Hr;
   end;
   
   ------------------------------------------------------------------------
   -- Create functions (for activatable classes)
   ------------------------------------------------------------------------
   
   
   function CreateAppointment return Windows.ApplicationModel.Appointments.IAppointment is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.Appointment");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAppointment := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Appointments.IID_IAppointment'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAppointmentOrganizer return Windows.ApplicationModel.Appointments.IAppointmentParticipant is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentOrganizer");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAppointmentParticipant := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Appointments.IID_IAppointmentParticipant'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAppointmentInvitee return Windows.ApplicationModel.Appointments.IAppointmentInvitee is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentInvitee");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAppointmentInvitee := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Appointments.IID_IAppointmentInvitee'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateAppointmentRecurrence return Windows.ApplicationModel.Appointments.IAppointmentRecurrence is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentRecurrence");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAppointmentRecurrence := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Appointments.IID_IAppointmentRecurrence'Access, RetVal'Address);
         RefCount := Instance.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function CreateFindAppointmentsOptions return Windows.ApplicationModel.Appointments.IFindAppointmentsOptions is
      Hr            : Windows.HResult := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.FindAppointmentsOptions");
      Instance      : aliased IInspectable := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IFindAppointmentsOptions := null;
   begin
      Hr := RoActivateInstance(m_hString, Instance'Address);
      if Hr = 0 then
         Hr := Instance.QueryInterface(Windows.ApplicationModel.Appointments.IID_IFindAppointmentsOptions'Access, RetVal'Address);
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
   
   
   function GetForUser
   (
      user : Windows.System.IUser
   )
   return Windows.ApplicationModel.Appointments.IAppointmentManagerForUser is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics3 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAppointmentManagerForUser;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics3'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.GetForUser(user, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAppointmentDetailsAsync
   (
      appointmentId : Windows.String
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAppointmentDetailsAsync(appointmentId, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAppointmentDetailsWithDateAsync
   (
      appointmentId : Windows.String
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAppointmentDetailsWithDateAsync(appointmentId, instanceStartDate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowEditNewAppointmentAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowEditNewAppointmentAsync(appointment, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function RequestStoreAsync
   (
      options : Windows.ApplicationModel.Appointments.AppointmentStoreAccessType
   )
   return Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.ApplicationModel.Appointments.IAsyncOperation_IAppointmentStore;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.RequestStoreAsync(options, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAddAppointmentAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAddAppointmentAsync(appointment, selection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowAddAppointmentWithPlacementAsync
   (
      appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowAddAppointmentWithPlacementAsync(appointment, selection, preferredPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowReplaceAppointmentAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowReplaceAppointmentAsync(appointmentId, appointment, selection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowReplaceAppointmentWithPlacementAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowReplaceAppointmentWithPlacementAsync(appointmentId, appointment, selection, preferredPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowReplaceAppointmentWithPlacementAndDateAsync
   (
      appointmentId : Windows.String
      ; appointment : Windows.ApplicationModel.Appointments.IAppointment
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncOperation_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowReplaceAppointmentWithPlacementAndDateAsync(appointmentId, appointment, selection, preferredPlacement, instanceStartDate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowRemoveAppointmentAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowRemoveAppointmentAsync(appointmentId, selection, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowRemoveAppointmentWithPlacementAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowRemoveAppointmentWithPlacementAsync(appointmentId, selection, preferredPlacement, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowRemoveAppointmentWithPlacementAndDateAsync
   (
      appointmentId : Windows.String
      ; selection : Windows.Foundation.Rect
      ; preferredPlacement : Windows.UI.Popups.Placement
      ; instanceStartDate : Windows.Foundation.DateTime
   )
   return Windows.Foundation.IAsyncOperation_Boolean is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncOperation_Boolean;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowRemoveAppointmentWithPlacementAndDateAsync(appointmentId, selection, preferredPlacement, instanceStartDate, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function ShowTimeFrameAsync
   (
      timeToShow : Windows.Foundation.DateTime
      ; duration : Windows.Foundation.TimeSpan
   )
   return Windows.Foundation.IAsyncAction is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentManager");
      m_Factory     : IAppointmentManagerStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.IAsyncAction;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentManagerStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.ShowTimeFrameAsync(timeToShow, duration, RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Subject
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Subject(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Location
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Location(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_StartTime
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_StartTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Duration
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Duration(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Reminder
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Reminder(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_BusyStatus
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_BusyStatus(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Sensitivity
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Sensitivity(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OriginalStartTime
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OriginalStartTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsResponseRequested
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsResponseRequested(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllowNewTimeProposal
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllowNewTimeProposal(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_AllDay
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_AllDay(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Details
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Details(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_OnlineMeetingLink
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_OnlineMeetingLink(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ReplyTime
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ReplyTime(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Organizer
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Organizer(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_UserResponse
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_UserResponse(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_HasInvitees
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_HasInvitees(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsCanceledMeeting
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsCanceledMeeting(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_IsOrganizedByUser
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_IsOrganizedByUser(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Recurrence
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Recurrence(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Uri
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Uri(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_Invitees
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_Invitees(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DefaultProperties
   return Windows.Foundation.Collections.IVector_String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.Foundation.Collections.IVector_String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DefaultProperties(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_ChangeNumber
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_ChangeNumber(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_RemoteChangeNumber
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_RemoteChangeNumber(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;
   
   function get_DetailsKind
   return Windows.String is
      Hr            : Windows.HRESULT := S_OK;
      m_hString     : Windows.String := To_String("Windows.ApplicationModel.Appointments.AppointmentProperties");
      m_Factory     : IAppointmentPropertiesStatics2 := null;
      RefCount      : Windows.UInt32 := 0;
      RetVal        : aliased Windows.String;
   begin
      Hr := RoGetActivationFactory(m_hString, IID_IAppointmentPropertiesStatics2'Access , m_Factory'Address);
      if Hr = 0 then
         Hr := m_Factory.get_DetailsKind(RetVal'Access);
         RefCount := m_Factory.Release;
      end if;
      Hr := WindowsDeleteString(m_hString);
      return RetVal;
   end;

end;
