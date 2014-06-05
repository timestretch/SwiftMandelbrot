//
//  main.swift
//  SwiftMandelbrot
//
//  Created by Erik Wrenholt on 6/4/14.
//  Public Domain.
//

import Foundation

enum IterationResults {
	case maxed
	case iterations(Int)
}

func iterate(xx: Double, yy: Double) -> IterationResults {

	let iterations = 1000
	let bailout = 16.0
	
	var cr = yy - 0.5
	var ci = xx
	var zi = 0.0
	var zr = 0.0
	
	var i = 0
	
	while (i++ < iterations) {
		var temp = zr * zi
		var zr2 = zr * zr
		var zi2 = zi * zi
		zr = zr2 - zi2 + cr
		zi = temp + temp + ci
		if (zi2 + zr2 > bailout) {
			return .iterations(i);
		}
	}
	return .maxed
}

for y in -39..39 {
	for x in -39..39 {
		switch (iterate(Double(x) / 40.0, Double(y) / 40.0)) {
		case .iterations(_):
			print(" ")
		case .maxed:
			print("*")
		}
	}
	println("");
}