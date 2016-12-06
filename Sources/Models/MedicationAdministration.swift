//
//  MedicationAdministration.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.8.0.10521 (http://hl7.org/fhir/StructureDefinition/MedicationAdministration) on 2016-12-06.
//  2016, SMART Health IT.
//

import Foundation


/**
Administration of medication to a patient.

Describes the event of a patient consuming or otherwise being administered a medication.  This may be as simple as
swallowing a tablet or it may be a long running infusion.  Related resources tie this event to the authorizing
prescription, and the specific encounter between patient and health care practitioner.
*/
open class MedicationAdministration: DomainResource {
	override open class var resourceType: String {
		get { return "MedicationAdministration" }
	}
	
	/// Device used to administer.
	public var device: [Reference]?
	
	/// Details of how medication was taken.
	public var dosage: MedicationAdministrationDosage?
	
	/// Start and end time of administration.
	public var effectiveDateTime: DateTime?
	
	/// Start and end time of administration.
	public var effectivePeriod: Period?
	
	/// Encounter administered as part of.
	public var encounter: Reference?
	
	/// A list of events of interest in the lifecycle.
	public var eventHistory: [Reference]?
	
	/// External identifier.
	public var identifier: [Identifier]?
	
	/// What was administered.
	public var medicationCodeableConcept: CodeableConcept?
	
	/// What was administered.
	public var medicationReference: Reference?
	
	/// True if medication not administered.
	public var notGiven: Bool?
	
	/// Information about the administration.
	public var note: [Annotation]?
	
	/// Who received medication.
	public var patient: Reference?
	
	/// Who administered substance.
	public var performer: Reference?
	
	/// Request administration performed against.
	public var prescription: Reference?
	
	/// Reason administration performed.
	public var reasonGiven: [CodeableConcept]?
	
	/// Reason administration not performed.
	public var reasonNotGiven: [CodeableConcept]?
	
	/// Condition or Observation that supports why the medication was administered.
	public var reasonReference: [Reference]?
	
	/// Will generally be set to show that the administration has been completed.  For some long running administrations
	/// such as infusions it is possible for an administration to be started but not completed or it may be paused while
	/// some other process is under way.
	public var status: MedicationAdministrationStatus?
	
	/// Additional information to support administration.
	public var supportingInformation: [Reference]?
	
	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(effective: Any, medication: Any, patient: Reference, status: MedicationAdministrationStatus) {
		self.init()
		if let value = effective as? DateTime {
			self.effectiveDateTime = value
		}
		else if let value = effective as? Period {
			self.effectivePeriod = value
		}
		else {
			fhir_warn("Type “\(type(of: effective))” for property “\(effective)” is invalid, ignoring")
		}
		if let value = medication as? CodeableConcept {
			self.medicationCodeableConcept = value
		}
		else if let value = medication as? Reference {
			self.medicationReference = value
		}
		else {
			fhir_warn("Type “\(type(of: medication))” for property “\(medication)” is invalid, ignoring")
		}
		self.patient = patient
		self.status = status
	}
	
	
	override open func populate(from json: FHIRJSON, presentKeys: inout Set<String>) throws -> [FHIRValidationError]? {
		var errors = try super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRValidationError]()
		if let exist = json["device"] {
			presentKeys.insert("device")
			if let val = exist as? [FHIRJSON] {
				do {
					self.device = try Reference.instantiate(fromArray: val, owner: self) as? [Reference]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "device"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "device", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["dosage"] {
			presentKeys.insert("dosage")
			if let val = exist as? FHIRJSON {
				do {
					self.dosage = try MedicationAdministrationDosage(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "dosage"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "dosage", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["effectiveDateTime"] {
			presentKeys.insert("effectiveDateTime")
			if let val = exist as? String {
				self.effectiveDateTime = DateTime(json: val)
			}
			else {
				errors.append(FHIRValidationError(key: "effectiveDateTime", wants: String.self, has: type(of: exist)))
			}
		}
		if let exist = json["effectivePeriod"] {
			presentKeys.insert("effectivePeriod")
			if let val = exist as? FHIRJSON {
				do {
					self.effectivePeriod = try Period(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "effectivePeriod"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "effectivePeriod", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["encounter"] {
			presentKeys.insert("encounter")
			if let val = exist as? FHIRJSON {
				do {
					self.encounter = try Reference(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "encounter"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["eventHistory"] {
			presentKeys.insert("eventHistory")
			if let val = exist as? [FHIRJSON] {
				do {
					self.eventHistory = try Reference.instantiate(fromArray: val, owner: self) as? [Reference]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "eventHistory"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "eventHistory", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["identifier"] {
			presentKeys.insert("identifier")
			if let val = exist as? [FHIRJSON] {
				do {
					self.identifier = try Identifier.instantiate(fromArray: val, owner: self) as? [Identifier]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "identifier"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["medicationCodeableConcept"] {
			presentKeys.insert("medicationCodeableConcept")
			if let val = exist as? FHIRJSON {
				do {
					self.medicationCodeableConcept = try CodeableConcept(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "medicationCodeableConcept"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "medicationCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["medicationReference"] {
			presentKeys.insert("medicationReference")
			if let val = exist as? FHIRJSON {
				do {
					self.medicationReference = try Reference(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "medicationReference"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "medicationReference", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["notGiven"] {
			presentKeys.insert("notGiven")
			if let val = exist as? Bool {
				self.notGiven = val
			}
			else {
				errors.append(FHIRValidationError(key: "notGiven", wants: Bool.self, has: type(of: exist)))
			}
		}
		if let exist = json["note"] {
			presentKeys.insert("note")
			if let val = exist as? [FHIRJSON] {
				do {
					self.note = try Annotation.instantiate(fromArray: val, owner: self) as? [Annotation]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "note"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "note", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["patient"] {
			presentKeys.insert("patient")
			if let val = exist as? FHIRJSON {
				do {
					self.patient = try Reference(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "patient"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		else {
			errors.append(FHIRValidationError(missing: "patient"))
		}
		if let exist = json["performer"] {
			presentKeys.insert("performer")
			if let val = exist as? FHIRJSON {
				do {
					self.performer = try Reference(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "performer"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["prescription"] {
			presentKeys.insert("prescription")
			if let val = exist as? FHIRJSON {
				do {
					self.prescription = try Reference(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "prescription"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "prescription", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["reasonGiven"] {
			presentKeys.insert("reasonGiven")
			if let val = exist as? [FHIRJSON] {
				do {
					self.reasonGiven = try CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "reasonGiven"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "reasonGiven", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["reasonNotGiven"] {
			presentKeys.insert("reasonNotGiven")
			if let val = exist as? [FHIRJSON] {
				do {
					self.reasonNotGiven = try CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "reasonNotGiven"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "reasonNotGiven", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["reasonReference"] {
			presentKeys.insert("reasonReference")
			if let val = exist as? [FHIRJSON] {
				do {
					self.reasonReference = try Reference.instantiate(fromArray: val, owner: self) as? [Reference]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "reasonReference"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "reasonReference", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		if let exist = json["status"] {
			presentKeys.insert("status")
			if let val = exist as? String {
				if let enumval = MedicationAdministrationStatus(rawValue: val) {
					self.status = enumval
				}
				else {
					errors.append(FHIRValidationError(key: "status", problem: "the value “\(val)” is not valid"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "status", wants: String.self, has: type(of: exist)))
			}
		}
		else {
			errors.append(FHIRValidationError(missing: "status"))
		}
		if let exist = json["supportingInformation"] {
			presentKeys.insert("supportingInformation")
			if let val = exist as? [FHIRJSON] {
				do {
					self.supportingInformation = try Reference.instantiate(fromArray: val, owner: self) as? [Reference]
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "supportingInformation"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "supportingInformation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
			}
		}
		
		// check if nonoptional expanded properties (i.e. at least one "answer" for "answer[x]") are present
		if nil == self.effectiveDateTime && nil == self.effectivePeriod {
			errors.append(FHIRValidationError(missing: "effective[x]"))
		}
		if nil == self.medicationCodeableConcept && nil == self.medicationReference {
			errors.append(FHIRValidationError(missing: "medication[x]"))
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON(errors: inout [FHIRValidationError]) -> FHIRJSON {
		var json = super.asJSON(errors: &errors)
		
		if let device = self.device {
			json["device"] = device.map() { $0.asJSON(errors: &errors) }
		}
		if let dosage = self.dosage {
			json["dosage"] = dosage.asJSON(errors: &errors)
		}
		if let effectiveDateTime = self.effectiveDateTime {
			json["effectiveDateTime"] = effectiveDateTime.asJSON()
		}
		if let effectivePeriod = self.effectivePeriod {
			json["effectivePeriod"] = effectivePeriod.asJSON(errors: &errors)
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON(errors: &errors)
		}
		if let eventHistory = self.eventHistory {
			json["eventHistory"] = eventHistory.map() { $0.asJSON(errors: &errors) }
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.map() { $0.asJSON(errors: &errors) }
		}
		if let medicationCodeableConcept = self.medicationCodeableConcept {
			json["medicationCodeableConcept"] = medicationCodeableConcept.asJSON(errors: &errors)
		}
		if let medicationReference = self.medicationReference {
			json["medicationReference"] = medicationReference.asJSON(errors: &errors)
		}
		if let notGiven = self.notGiven {
			json["notGiven"] = notGiven.asJSON()
		}
		if let note = self.note {
			json["note"] = note.map() { $0.asJSON(errors: &errors) }
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON(errors: &errors)
		}
		else {
			errors.append(FHIRValidationError(missing: "patient"))
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON(errors: &errors)
		}
		if let prescription = self.prescription {
			json["prescription"] = prescription.asJSON(errors: &errors)
		}
		if let reasonGiven = self.reasonGiven {
			json["reasonGiven"] = reasonGiven.map() { $0.asJSON(errors: &errors) }
		}
		if let reasonNotGiven = self.reasonNotGiven {
			json["reasonNotGiven"] = reasonNotGiven.map() { $0.asJSON(errors: &errors) }
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.map() { $0.asJSON(errors: &errors) }
		}
		if let status = self.status {
			json["status"] = status.rawValue
		}
		else {
			errors.append(FHIRValidationError(missing: "status"))
		}
		if let supportingInformation = self.supportingInformation {
			json["supportingInformation"] = supportingInformation.map() { $0.asJSON(errors: &errors) }
		}
		
		// check if nonoptional expanded properties (i.e. at least one "value" for "value[x]") are present
		if nil == self.effectiveDateTime && nil == self.effectivePeriod {
			errors.append(FHIRValidationError(missing: "effective[x]"))
		}
		if nil == self.medicationCodeableConcept && nil == self.medicationReference {
			errors.append(FHIRValidationError(missing: "medication[x]"))
		}
		
		return json
	}
}


/**
Details of how medication was taken.

Describes the medication dosage information details e.g. dose, rate, site, route, etc.
*/
open class MedicationAdministrationDosage: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationAdministrationDosage" }
	}
	
	/// Amount of medication per dose.
	public var dose: Quantity?
	
	/// How drug was administered.
	public var method: CodeableConcept?
	
	/// Dose quantity per unit of time.
	public var rateQuantity: Quantity?
	
	/// Dose quantity per unit of time.
	public var rateRatio: Ratio?
	
	/// Path of substance into body.
	public var route: CodeableConcept?
	
	/// Body site administered to.
	public var site: CodeableConcept?
	
	/// Free text dosage instructions e.g. SIG.
	public var text: FHIRString?
	
	
	override open func populate(from json: FHIRJSON, presentKeys: inout Set<String>) throws -> [FHIRValidationError]? {
		var errors = try super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRValidationError]()
		if let exist = json["dose"] {
			presentKeys.insert("dose")
			if let val = exist as? FHIRJSON {
				do {
					self.dose = try Quantity(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "dose"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "dose", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["method"] {
			presentKeys.insert("method")
			if let val = exist as? FHIRJSON {
				do {
					self.method = try CodeableConcept(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "method"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["rateQuantity"] {
			presentKeys.insert("rateQuantity")
			if let val = exist as? FHIRJSON {
				do {
					self.rateQuantity = try Quantity(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "rateQuantity"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "rateQuantity", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["rateRatio"] {
			presentKeys.insert("rateRatio")
			if let val = exist as? FHIRJSON {
				do {
					self.rateRatio = try Ratio(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "rateRatio"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "rateRatio", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["route"] {
			presentKeys.insert("route")
			if let val = exist as? FHIRJSON {
				do {
					self.route = try CodeableConcept(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "route"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "route", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["site"] {
			presentKeys.insert("site")
			if let val = exist as? FHIRJSON {
				do {
					self.site = try CodeableConcept(json: val, owner: self)
				}
				catch let error as FHIRValidationError {
					errors.append(error.prefixed(with: "site"))
				}
			}
			else {
				errors.append(FHIRValidationError(key: "site", wants: FHIRJSON.self, has: type(of: exist)))
			}
		}
		if let exist = json["text"] {
			presentKeys.insert("text")
			if let val = exist as? String {
				self.text = FHIRString(json: val)
			}
			else {
				errors.append(FHIRValidationError(key: "text", wants: String.self, has: type(of: exist)))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON(errors: inout [FHIRValidationError]) -> FHIRJSON {
		var json = super.asJSON(errors: &errors)
		
		if let dose = self.dose {
			json["dose"] = dose.asJSON(errors: &errors)
		}
		if let method = self.method {
			json["method"] = method.asJSON(errors: &errors)
		}
		if let rateQuantity = self.rateQuantity {
			json["rateQuantity"] = rateQuantity.asJSON(errors: &errors)
		}
		if let rateRatio = self.rateRatio {
			json["rateRatio"] = rateRatio.asJSON(errors: &errors)
		}
		if let route = self.route {
			json["route"] = route.asJSON(errors: &errors)
		}
		if let site = self.site {
			json["site"] = site.asJSON(errors: &errors)
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
}

