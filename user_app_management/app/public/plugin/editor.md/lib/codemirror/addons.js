/*! Editor.md v1.5.0 | addons.min.js | Open source online markdown editor. | MIT License | By: Pandao | https://github.com/pandao/editor.md | 2015-06-09 */
!
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    e.defineOption("showTrailingSpace", !1,
    function(t, i, o) {
        o == e.Init && (o = !1),
        o && !i ? t.removeOverlay("trailingspace") : !o && i && t.addOverlay({
            token: function(e) {
                for (var t = e.string.length,
                i = t; i && /\s/.test(e.string.charAt(i - 1)); --i);
                return i > e.pos ? (e.pos = i, null) : (e.pos = t, "trailingspace")
            },
            name: "trailingspace"
        })
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    function t(e, t, i) {
        var o, r = e.getWrapperElement();
        return o = r.appendChild(document.createElement("div")),
        i ? o.className = "CodeMirror-dialog CodeMirror-dialog-bottom": o.className = "CodeMirror-dialog CodeMirror-dialog-top",
        "string" == typeof t ? o.innerHTML = t: o.appendChild(t),
        o
    }
    function i(e, t) {
        e.state.currentNotificationClose && e.state.currentNotificationClose(),
        e.state.currentNotificationClose = t
    }
    e.defineExtension("openDialog",
    function(o, r, n) {
        function a(e) {
            if ("string" == typeof e) h.value = e;
            else {
                if (c) return;
                c = !0,
                l.parentNode.removeChild(l),
                d.focus(),
                n.onClose && n.onClose(l)
            }
        }
        n || (n = {}),
        i(this, null);
        var s, l = t(this, o, n.bottom),
        c = !1,
        d = this,
        h = l.getElementsByTagName("input")[0];
        return h ? (n.value && (h.value = n.value, h.select()), n.onInput && e.on(h, "input",
        function(e) {
            n.onInput(e, h.value, a)
        }), n.onKeyUp && e.on(h, "keyup",
        function(e) {
            n.onKeyUp(e, h.value, a)
        }), e.on(h, "keydown",
        function(t) {
            n && n.onKeyDown && n.onKeyDown(t, h.value, a) || ((27 == t.keyCode || n.closeOnEnter !== !1 && 13 == t.keyCode) && (h.blur(), e.e_stop(t), a()), 13 == t.keyCode && r(h.value, t))
        }), n.closeOnBlur !== !1 && e.on(h, "blur", a), h.focus()) : (s = l.getElementsByTagName("button")[0]) && (e.on(s, "click",
        function() {
            a(),
            d.focus()
        }), n.closeOnBlur !== !1 && e.on(s, "blur", a), s.focus()),
        a
    }),
    e.defineExtension("openConfirm",
    function(o, r, n) {
        function a() {
            c || (c = !0, s.parentNode.removeChild(s), d.focus())
        }
        i(this, null);
        var s = t(this, o, n && n.bottom),
        l = s.getElementsByTagName("button"),
        c = !1,
        d = this,
        h = 1;
        l[0].focus();
        for (var u = 0; u < l.length; ++u) {
            var f = l[u]; !
            function(t) {
                e.on(f, "click",
                function(i) {
                    e.e_preventDefault(i),
                    a(),
                    t && t(d)
                })
            } (r[u]),
            e.on(f, "blur",
            function() {--h,
                setTimeout(function() {
                    0 >= h && a()
                },
                200)
            }),
            e.on(f, "focus",
            function() {++h
            })
        }
    }),
    e.defineExtension("openNotification",
    function(o, r) {
        function n() {
            l || (l = !0, clearTimeout(a), s.parentNode.removeChild(s))
        }
        i(this, n);
        var a, s = t(this, o, r && r.bottom),
        l = !1,
        c = r && "undefined" != typeof r.duration ? r.duration: 5e3;
        return e.on(s, "click",
        function(t) {
            e.e_preventDefault(t),
            n()
        }),
        c && (a = setTimeout(n, c)),
        n
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e, t, r, n) {
        if (this.atOccurrence = !1, this.doc = e, null == n && "string" == typeof t && (n = !1), r = r ? e.clipPos(r) : o(0, 0), this.pos = {
            from: r,
            to: r
        },
        "string" != typeof t) t.global || (t = new RegExp(t.source, t.ignoreCase ? "ig": "g")),
        this.matches = function(i, r) {
            if (i) {
                t.lastIndex = 0;
                for (var n, a, s = e.getLine(r.line).slice(0, r.ch), l = 0;;) {
                    t.lastIndex = l;
                    var c = t.exec(s);
                    if (!c) break;
                    if (n = c, a = n.index, l = n.index + (n[0].length || 1), l == s.length) break
                }
                var d = n && n[0].length || 0;
                d || (0 == a && 0 == s.length ? n = void 0 : a != e.getLine(r.line).length && d++)
            } else {
                t.lastIndex = r.ch;
                var s = e.getLine(r.line),
                n = t.exec(s),
                d = n && n[0].length || 0,
                a = n && n.index;
                a + d == s.length || d || (d = 1)
            }
            return n && d ? {
                from: o(r.line, a),
                to: o(r.line, a + d),
                match: n
            }: void 0
        };
        else {
            var a = t;
            n && (t = t.toLowerCase());
            var s = n ?
            function(e) {
                return e.toLowerCase()
            }: function(e) {
                return e
            },
            l = t.split("\n");
            if (1 == l.length) t.length ? this.matches = function(r, n) {
                if (r) {
                    var l = e.getLine(n.line).slice(0, n.ch),
                    c = s(l),
                    d = c.lastIndexOf(t);
                    if (d > -1) return d = i(l, c, d),
                    {
                        from: o(n.line, d),
                        to: o(n.line, d + a.length)
                    }
                } else {
                    var l = e.getLine(n.line).slice(n.ch),
                    c = s(l),
                    d = c.indexOf(t);
                    if (d > -1) return d = i(l, c, d) + n.ch,
                    {
                        from: o(n.line, d),
                        to: o(n.line, d + a.length)
                    }
                }
            }: this.matches = function() {};
            else {
                var c = a.split("\n");
                this.matches = function(t, i) {
                    var r = l.length - 1;
                    if (t) {
                        if (i.line - (l.length - 1) < e.firstLine()) return;
                        if (s(e.getLine(i.line).slice(0, c[r].length)) != l[l.length - 1]) return;
                        for (var n = o(i.line, c[r].length), a = i.line - 1, d = r - 1; d >= 1; --d, --a) if (l[d] != s(e.getLine(a))) return;
                        var h = e.getLine(a),
                        u = h.length - c[0].length;
                        if (s(h.slice(u)) != l[0]) return;
                        return {
                            from: o(a, u),
                            to: n
                        }
                    }
                    if (! (i.line + (l.length - 1) > e.lastLine())) {
                        var h = e.getLine(i.line),
                        u = h.length - c[0].length;
                        if (s(h.slice(u)) == l[0]) {
                            for (var f = o(i.line, u), a = i.line + 1, d = 1; r > d; ++d, ++a) if (l[d] != s(e.getLine(a))) return;
                            if (s(e.getLine(a).slice(0, c[r].length)) == l[r]) return {
                                from: f,
                                to: o(a, c[r].length)
                            }
                        }
                    }
                }
            }
        }
    }
    function i(e, t, i) {
        if (e.length == t.length) return i;
        for (var o = Math.min(i, e.length);;) {
            var r = e.slice(0, o).toLowerCase().length;
            if (i > r)++o;
            else {
                if (! (r > i)) return o; --o
            }
        }
    }
    var o = e.Pos;
    t.prototype = {
        findNext: function() {
            return this.find(!1)
        },
        findPrevious: function() {
            return this.find(!0)
        },
        find: function(e) {
            function t(e) {
                var t = o(e, 0);
                return i.pos = {
                    from: t,
                    to: t
                },
                i.atOccurrence = !1,
                !1
            }
            for (var i = this,
            r = this.doc.clipPos(e ? this.pos.from: this.pos.to);;) {
                if (this.pos = this.matches(e, r)) return this.atOccurrence = !0,
                this.pos.match || !0;
                if (e) {
                    if (!r.line) return t(0);
                    r = o(r.line - 1, this.doc.getLine(r.line - 1).length)
                } else {
                    var n = this.doc.lineCount();
                    if (r.line == n - 1) return t(n);
                    r = o(r.line + 1, 0)
                }
            }
        },
        from: function() {
            return this.atOccurrence ? this.pos.from: void 0
        },
        to: function() {
            return this.atOccurrence ? this.pos.to: void 0
        },
        replace: function(t) {
            if (this.atOccurrence) {
                var i = e.splitLines(t);
                this.doc.replaceRange(i, this.pos.from, this.pos.to),
                this.pos.to = o(this.pos.from.line + i.length - 1, i[i.length - 1].length + (1 == i.length ? this.pos.from.ch: 0))
            }
        }
    },
    e.defineExtension("getSearchCursor",
    function(e, i, o) {
        return new t(this.doc, e, i, o)
    }),
    e.defineDocExtension("getSearchCursor",
    function(e, i, o) {
        return new t(this, e, i, o)
    }),
    e.defineExtension("selectMatches",
    function(t, i) {
        for (var o, r = [], n = this.getSearchCursor(t, this.getCursor("from"), i); (o = n.findNext()) && !(e.cmpPos(n.to(), this.getCursor("to")) > 0);) r.push({
            anchor: n.from(),
            head: n.to()
        });
        r.length && this.setSelections(r, 0)
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror"), require("./searchcursor"), require("../dialog/dialog")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror", "./searchcursor", "../dialog/dialog"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e, t) {
        return "string" == typeof e ? e = new RegExp(e.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"), t ? "gi": "g") : e.global || (e = new RegExp(e.source, e.ignoreCase ? "gi": "g")),
        {
            token: function(t) {
                e.lastIndex = t.pos;
                var i = e.exec(t.string);
                return i && i.index == t.pos ? (t.pos += i[0].length, "searching") : void(i ? t.pos = i.index: t.skipToEnd())
            }
        }
    }
    function i() {
        this.posFrom = this.posTo = this.query = null,
        this.overlay = null
    }
    function o(e) {
        return e.state.search || (e.state.search = new i)
    }
    function r(e) {
        return "string" == typeof e && e == e.toLowerCase()
    }
    function n(e, t, i) {
        return e.getSearchCursor(t, i, r(t))
    }
    function a(e, t, i, o, r) {
        e.openDialog ? e.openDialog(t, r, {
            value: o
        }) : r(prompt(i, o))
    }
    function s(e, t, i, o) {
        e.openConfirm ? e.openConfirm(t, o) : confirm(i) && o[0]()
    }
    function l(e) {
        var t = e.match(/^\/(.*)\/([a-z]*)$/);
        if (t) try {
            e = new RegExp(t[1], -1 == t[2].indexOf("i") ? "": "i")
        } catch(i) {}
        return ("string" == typeof e ? "" == e: e.test("")) && (e = /x^/),
        e
    }
    function c(e, i) {
        var n = o(e);
        return n.query ? d(e, i) : void a(e, f, "Search for:", e.getSelection(),
        function(o) {
            e.operation(function() {
                o && !n.query && (n.query = l(o), e.removeOverlay(n.overlay, r(n.query)), n.overlay = t(n.query, r(n.query)), e.addOverlay(n.overlay), e.showMatchesOnScrollbar && (n.annotate && (n.annotate.clear(), n.annotate = null), n.annotate = e.showMatchesOnScrollbar(n.query, r(n.query))), n.posFrom = n.posTo = e.getCursor(), d(e, i))
            })
        })
    }
    function d(t, i) {
        t.operation(function() {
            var r = o(t),
            a = n(t, r.query, i ? r.posFrom: r.posTo); (a.find(i) || (a = n(t, r.query, i ? e.Pos(t.lastLine()) : e.Pos(t.firstLine(), 0)), a.find(i))) && (t.setSelection(a.from(), a.to()), t.scrollIntoView({
                from: a.from(),
                to: a.to()
            }), r.posFrom = a.from(), r.posTo = a.to())
        })
    }
    function h(e) {
        e.operation(function() {
            var t = o(e);
            t.query && (t.query = null, e.removeOverlay(t.overlay), t.annotate && (t.annotate.clear(), t.annotate = null))
        })
    }
    function u(e, t) {
        e.getOption("readOnly") || a(e, g, "Replace:", e.getSelection(),
        function(i) {
            i && (i = l(i), a(e, p, "Replace with:", "",
            function(o) {
                if (t) e.operation(function() {
                    for (var t = n(e, i); t.findNext();) if ("string" != typeof i) {
                        var r = e.getRange(t.from(), t.to()).match(i);
                        t.replace(o.replace(/\$(\d)/g,
                        function(e, t) {
                            return r[t]
                        }))
                    } else t.replace(o)
                });
                else {
                    h(e);
                    var r = n(e, i, e.getCursor()),
                    a = function() {
                        var t, o = r.from(); ! (t = r.findNext()) && (r = n(e, i), !(t = r.findNext()) || o && r.from().line == o.line && r.from().ch == o.ch) || (e.setSelection(r.from(), r.to()), e.scrollIntoView({
                            from: r.from(),
                            to: r.to()
                        }), s(e, m, "Replace?", [function() {
                            l(t)
                        },
                        a]))
                    },
                    l = function(e) {
                        r.replace("string" == typeof i ? o: o.replace(/\$(\d)/g,
                        function(t, i) {
                            return e[i]
                        })),
                        a()
                    };
                    a()
                }
            }))
        })
    }
    var f = 'Search: <input type="text" style="width: 10em" class="CodeMirror-search-field"/> <span style="color: #888" class="CodeMirror-search-hint">(Use /re/ syntax for regexp search)</span>',
    g = 'Replace: <input type="text" style="width: 10em" class="CodeMirror-search-field"/> <span style="color: #888" class="CodeMirror-search-hint">(Use /re/ syntax for regexp search)</span>',
    p = 'With: <input type="text" style="width: 10em" class="CodeMirror-search-field"/>',
    m = "Replace? <button>Yes</button> <button>No</button> <button>Stop</button>";
    e.commands.find = function(e) {
        h(e),
        c(e)
    },
    e.commands.findNext = c,
    e.commands.findPrev = function(e) {
        c(e, !0)
    },
    e.commands.clearSearch = h,
    e.commands.replace = u,
    e.commands.replaceAll = function(e) {
        u(e, !0)
    }
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e, t) {
        function i(e) {
            clearTimeout(o.doRedraw),
            o.doRedraw = setTimeout(function() {
                o.redraw()
            },
            e)
        }
        this.cm = e,
        this.options = t,
        this.buttonHeight = t.scrollButtonHeight || e.getOption("scrollButtonHeight"),
        this.annotations = [],
        this.doRedraw = this.doUpdate = null,
        this.div = e.getWrapperElement().appendChild(document.createElement("div")),
        this.div.style.cssText = "position: absolute; right: 0; top: 0; z-index: 7; pointer-events: none",
        this.computeScale();
        var o = this;
        e.on("refresh", this.resizeHandler = function() {
            clearTimeout(o.doUpdate),
            o.doUpdate = setTimeout(function() {
                o.computeScale() && i(20)
            },
            100)
        }),
        e.on("markerAdded", this.resizeHandler),
        e.on("markerCleared", this.resizeHandler),
        t.listenForChanges !== !1 && e.on("change", this.changeHandler = function() {
            i(250)
        })
    }
    e.defineExtension("annotateScrollbar",
    function(e) {
        return "string" == typeof e && (e = {
            className: e
        }),
        new t(this, e)
    }),
    e.defineOption("scrollButtonHeight", 0),
    t.prototype.computeScale = function() {
        var e = this.cm,
        t = (e.getWrapperElement().clientHeight - e.display.barHeight - 2 * this.buttonHeight) / e.heightAtLine(e.lastLine() + 1, "local");
        return t != this.hScale ? (this.hScale = t, !0) : void 0
    },
    t.prototype.update = function(e) {
        this.annotations = e,
        this.redraw()
    },
    t.prototype.redraw = function(e) {
        e !== !1 && this.computeScale();
        var t = this.cm,
        i = this.hScale,
        o = document.createDocumentFragment(),
        r = this.annotations;
        if (t.display.barWidth) for (var n, a = 0; a < r.length; a++) {
            for (var s = r[a], l = n || t.charCoords(s.from, "local").top * i, c = t.charCoords(s.to, "local").bottom * i; a < r.length - 1 && (n = t.charCoords(r[a + 1].from, "local").top * i, !(n > c + .9));) s = r[++a],
            c = t.charCoords(s.to, "local").bottom * i;
            if (c != l) {
                var d = Math.max(c - l, 3),
                h = o.appendChild(document.createElement("div"));
                h.style.cssText = "position: absolute; right: 0px; width: " + Math.max(t.display.barWidth - 1, 2) + "px; top: " + (l + this.buttonHeight) + "px; height: " + d + "px",
                h.className = this.options.className
            }
        }
        this.div.textContent = "",
        this.div.appendChild(o)
    },
    t.prototype.clear = function() {
        this.cm.off("refresh", this.resizeHandler),
        this.cm.off("markerAdded", this.resizeHandler),
        this.cm.off("markerCleared", this.resizeHandler),
        this.changeHandler && this.cm.off("change", this.changeHandler),
        this.div.parentNode.removeChild(this.div)
    }
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror"), require("./searchcursor"), require("../scroll/annotatescrollbar")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror", "./searchcursor", "../scroll/annotatescrollbar"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e, t, i, o) {
        this.cm = e;
        var r = {
            listenForChanges: !1
        };
        for (var n in o) r[n] = o[n];
        r.className || (r.className = "CodeMirror-search-match"),
        this.annotation = e.annotateScrollbar(r),
        this.query = t,
        this.caseFold = i,
        this.gap = {
            from: e.firstLine(),
            to: e.lastLine() + 1
        },
        this.matches = [],
        this.update = null,
        this.findMatches(),
        this.annotation.update(this.matches);
        var a = this;
        e.on("change", this.changeHandler = function(e, t) {
            a.onChange(t)
        })
    }
    function i(e, t, i) {
        return t >= e ? e: Math.max(t, e + i)
    }
    e.defineExtension("showMatchesOnScrollbar",
    function(e, i, o) {
        return "string" == typeof o && (o = {
            className: o
        }),
        o || (o = {}),
        new t(this, e, i, o)
    });
    var o = 1e3;
    t.prototype.findMatches = function() {
        if (this.gap) {
            for (var t = 0; t < this.matches.length; t++) {
                var i = this.matches[t];
                if (i.from.line >= this.gap.to) break;
                i.to.line >= this.gap.from && this.matches.splice(t--, 1)
            }
            for (var r = this.cm.getSearchCursor(this.query, e.Pos(this.gap.from, 0), this.caseFold); r.findNext();) {
                var i = {
                    from: r.from(),
                    to: r.to()
                };
                if (i.from.line >= this.gap.to) break;
                if (this.matches.splice(t++, 0, i), this.matches.length > o) break
            }
            this.gap = null
        }
    },
    t.prototype.onChange = function(t) {
        var o = t.from.line,
        r = e.changeEnd(t).line,
        n = r - t.to.line;
        if (this.gap ? (this.gap.from = Math.min(i(this.gap.from, o, n), t.from.line), this.gap.to = Math.max(i(this.gap.to, o, n), t.from.line)) : this.gap = {
            from: t.from.line,
            to: r + 1
        },
        n) for (var a = 0; a < this.matches.length; a++) {
            var s = this.matches[a],
            l = i(s.from.line, o, n);
            l != s.from.line && (s.from = e.Pos(l, s.from.ch));
            var c = i(s.to.line, o, n);
            c != s.to.line && (s.to = e.Pos(c, s.to.ch))
        }
        clearTimeout(this.update);
        var d = this;
        this.update = setTimeout(function() {
            d.updateAfterChange()
        },
        250)
    },
    t.prototype.updateAfterChange = function() {
        this.findMatches(),
        this.annotation.update(this.matches)
    },
    t.prototype.clear = function() {
        this.cm.off("change", this.changeHandler),
        this.annotation.clear()
    }
}),
(function(mod) {
    if (typeof exports == "object" && typeof module == "object") // CommonJS
      mod(require("../codemirror"));
    else if (typeof define == "function" && define.amd) // AMD
      define(["../../lib/codemirror"], mod);
    else // Plain browser env
      mod(CodeMirror);
  })(function(CodeMirror) {
    CodeMirror.defineOption("placeholder", "", function(cm, val, old) {
      var prev = old && old != CodeMirror.Init;
      if (val && !prev) {
        cm.on("blur", onBlur);
        cm.on("change", onChange);
        cm.on("swapDoc", onChange);
        CodeMirror.on(cm.getInputField(), "compositionupdate", cm.state.placeholderCompose = function() { onComposition(cm) })
        onChange(cm);
      } else if (!val && prev) {
        cm.off("blur", onBlur);
        cm.off("change", onChange);
        cm.off("swapDoc", onChange);
        CodeMirror.off(cm.getInputField(), "compositionupdate", cm.state.placeholderCompose)
        clearPlaceholder(cm);
        var wrapper = cm.getWrapperElement();
        wrapper.className = wrapper.className.replace(" CodeMirror-empty", "");
      }
  
      if (val && !cm.hasFocus()) onBlur(cm);
    });
  
    function clearPlaceholder(cm) {
      if (cm.state.placeholder) {
        cm.state.placeholder.parentNode.removeChild(cm.state.placeholder);
        cm.state.placeholder = null;
      }
    }
    function setPlaceholder(cm) {
      clearPlaceholder(cm);
      var elt = cm.state.placeholder = document.createElement("pre");
      elt.style.cssText = "height: 0; overflow: visible";
      elt.style.direction = cm.getOption("direction");
      elt.className = "CodeMirror-placeholder CodeMirror-line-like";
      var placeHolder = cm.getOption("placeholder")
      if (typeof placeHolder == "string") placeHolder = document.createTextNode(placeHolder)
      elt.appendChild(placeHolder)
      cm.display.lineSpace.insertBefore(elt, cm.display.lineSpace.firstChild);
    }
  
    function onComposition(cm) {
      setTimeout(function() {
        var empty = false
        if (cm.lineCount() == 1) {
          var input = cm.getInputField()
          empty = input.nodeName == "TEXTAREA" ? !cm.getLine(0).length
            : !/[^\u200b]/.test(input.querySelector(".CodeMirror-line").textContent)
        }
        if (empty) setPlaceholder(cm)
        else clearPlaceholder(cm)
      }, 20)
    }
  
    function onBlur(cm) {
      if (isEmpty(cm)) setPlaceholder(cm);
    }
    function onChange(cm) {
      var wrapper = cm.getWrapperElement(), empty = isEmpty(cm);
      wrapper.className = wrapper.className.replace(" CodeMirror-empty", "") + (empty ? " CodeMirror-empty" : "");
  
      if (empty) setPlaceholder(cm);
      else clearPlaceholder(cm);
    }
  
    function isEmpty(cm) {
      return (cm.lineCount() === 1) && (cm.getLine(0) === "");
    }
  }),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror"), require("../fold/xml-fold")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror", "../fold/xml-fold"], e) : e(CodeMirror)
} (function(e) {
    function t(t) {
        if (t.getOption("disableInput")) return e.Pass;
        for (var i = t.listSelections(), o = [], l = 0; l < i.length; l++) {
            if (!i[l].empty()) return e.Pass;
            var c = i[l].head,
            d = t.getTokenAt(c),
            h = e.innerMode(t.getMode(), d.state),
            u = h.state;
            if ("xml" != h.mode.name || !u.tagName) return e.Pass;
            var f = t.getOption("autoCloseTags"),
            g = "html" == h.mode.configuration,
            p = "object" == typeof f && f.dontCloseTags || g && a,
            m = "object" == typeof f && f.indentTags || g && s,
            v = u.tagName;
            d.end > c.ch && (v = v.slice(0, v.length - d.end + c.ch));
            var w = v.toLowerCase();
            if (!v || "string" == d.type && (d.end != c.ch || !/[\"\']/.test(d.string.charAt(d.string.length - 1)) || 1 == d.string.length) || "tag" == d.type && "closeTag" == u.type || d.string.indexOf("/") == d.string.length - 1 || p && r(p, w) > -1 || n(t, v, c, u, !0)) return e.Pass;
            var b = m && r(m, w) > -1;
            o[l] = {
                indent: b,
                text: ">" + (b ? "\n\n": "") + "</" + v + ">",
                newPos: b ? e.Pos(c.line + 1, 0) : e.Pos(c.line, c.ch + 1)
            }
        }
        for (var l = i.length - 1; l >= 0; l--) {
            var y = o[l];
            t.replaceRange(y.text, i[l].head, i[l].anchor, "+insert");
            var k = t.listSelections().slice(0);
            k[l] = {
                head: y.newPos,
                anchor: y.newPos
            },
            t.setSelections(k),
            y.indent && (t.indentLine(y.newPos.line, null, !0), t.indentLine(y.newPos.line + 1, null, !0))
        }
    }
    function i(t, i) {
        for (var o = t.listSelections(), r = [], a = i ? "/": "</", s = 0; s < o.length; s++) {
            if (!o[s].empty()) return e.Pass;
            var l = o[s].head,
            c = t.getTokenAt(l),
            d = e.innerMode(t.getMode(), c.state),
            h = d.state;
            if (i && ("string" == c.type || "<" != c.string.charAt(0) || c.start != l.ch - 1)) return e.Pass;
            if ("xml" != d.mode.name) if ("htmlmixed" == t.getMode().name && "javascript" == d.mode.name) r[s] = a + "script>";
            else {
                if ("htmlmixed" != t.getMode().name || "css" != d.mode.name) return e.Pass;
                r[s] = a + "style>"
            } else {
                if (!h.context || !h.context.tagName || n(t, h.context.tagName, l, h)) return e.Pass;
                r[s] = a + h.context.tagName + ">"
            }
        }
        t.replaceSelections(r),
        o = t.listSelections();
        for (var s = 0; s < o.length; s++)(s == o.length - 1 || o[s].head.line < o[s + 1].head.line) && t.indentLine(o[s].head.line)
    }
    function o(t) {
        return t.getOption("disableInput") ? e.Pass: i(t, !0)
    }
    function r(e, t) {
        if (e.indexOf) return e.indexOf(t);
        for (var i = 0,
        o = e.length; o > i; ++i) if (e[i] == t) return i;
        return - 1
    }
    function n(t, i, o, r, n) {
        if (!e.scanForClosingTag) return ! 1;
        var a = Math.min(t.lastLine() + 1, o.line + 500),
        s = e.scanForClosingTag(t, o, null, a);
        if (!s || s.tag != i) return ! 1;
        for (var l = r.context,
        c = n ? 1 : 0; l && l.tagName == i; l = l.prev)++c;
        o = s.to;
        for (var d = 1; c > d; d++) {
            var h = e.scanForClosingTag(t, o, null, a);
            if (!h || h.tag != i) return ! 1;
            o = h.to
        }
        return ! 0
    }
    e.defineOption("autoCloseTags", !1,
    function(i, r, n) {
        if (n != e.Init && n && i.removeKeyMap("autoCloseTags"), r) {
            var a = {
                name: "autoCloseTags"
            }; ("object" != typeof r || r.whenClosing) && (a["'/'"] = function(e) {
                return o(e)
            }),
            ("object" != typeof r || r.whenOpening) && (a["'>'"] = function(e) {
                return t(e)
            }),
            i.addKeyMap(a)
        }
    });
    var a = ["area", "base", "br", "col", "command", "embed", "hr", "img", "input", "keygen", "link", "meta", "param", "source", "track", "wbr"],
    s = ["applet", "blockquote", "body", "button", "div", "dl", "fieldset", "form", "frameset", "h1", "h2", "h3", "h4", "h5", "h6", "head", "html", "iframe", "layer", "legend", "object", "ol", "p", "select", "table", "ul"];
    e.commands.closeTag = function(e) {
        return i(e)
    }
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(t, r, n, a) {
        function s(e) {
            var i = l(t, r);
            if (!i || i.to.line - i.from.line < c) return null;
            for (var o = t.findMarksAt(i.from), n = 0; n < o.length; ++n) if (o[n].__isFold && "fold" !== a) {
                if (!e) return null;
                i.cleared = !0,
                o[n].clear()
            }
            return i
        }
        if (n && n.call) {
            var l = n;
            n = null
        } else var l = o(t, n, "rangeFinder");
        "number" == typeof r && (r = e.Pos(r, 0));
        var c = o(t, n, "minFoldSize"),
        d = s(!0);
        if (o(t, n, "scanUp")) for (; ! d && r.line > t.firstLine();) r = e.Pos(r.line - 1, 0),
        d = s(!1);
        if (d && !d.cleared && "unfold" !== a) {
            var h = i(t, n);
            e.on(h, "mousedown",
            function(t) {
                u.clear(),
                e.e_preventDefault(t)
            });
            var u = t.markText(d.from, d.to, {
                replacedWith: h,
                clearOnEnter: !0,
                __isFold: !0
            });
            u.on("clear",
            function(i, o) {
                e.signal(t, "unfold", t, i, o)
            }),
            e.signal(t, "fold", t, d.from, d.to)
        }
    }
    function i(e, t) {
        var i = o(e, t, "widget");
        if ("string" == typeof i) {
            var r = document.createTextNode(i);
            i = document.createElement("span"),
            i.appendChild(r),
            i.className = "CodeMirror-foldmarker"
        }
        return i
    }
    function o(e, t, i) {
        if (t && void 0 !== t[i]) return t[i];
        var o = e.options.foldOptions;
        return o && void 0 !== o[i] ? o[i] : r[i]
    }
    e.newFoldFunction = function(e, i) {
        return function(o, r) {
            t(o, r, {
                rangeFinder: e,
                widget: i
            })
        }
    },
    e.defineExtension("foldCode",
    function(e, i, o) {
        t(this, e, i, o)
    }),
    e.defineExtension("isFolded",
    function(e) {
        for (var t = this.findMarksAt(e), i = 0; i < t.length; ++i) if (t[i].__isFold) return ! 0
    }),
    e.commands.toggleFold = function(e) {
        e.foldCode(e.getCursor())
    },
    e.commands.fold = function(e) {
        e.foldCode(e.getCursor(), null, "fold")
    },
    e.commands.unfold = function(e) {
        e.foldCode(e.getCursor(), null, "unfold")
    },
    e.commands.foldAll = function(t) {
        t.operation(function() {
            for (var i = t.firstLine(), o = t.lastLine(); o >= i; i++) t.foldCode(e.Pos(i, 0), null, "fold")
        })
    },
    e.commands.unfoldAll = function(t) {
        t.operation(function() {
            for (var i = t.firstLine(), o = t.lastLine(); o >= i; i++) t.foldCode(e.Pos(i, 0), null, "unfold")
        })
    },
    e.registerHelper("fold", "combine",
    function() {
        var e = Array.prototype.slice.call(arguments, 0);
        return function(t, i) {
            for (var o = 0; o < e.length; ++o) {
                var r = e[o](t, i);
                if (r) return r
            }
        }
    }),
    e.registerHelper("fold", "auto",
    function(e, t) {
        for (var i = e.getHelpers(t, "fold"), o = 0; o < i.length; o++) {
            var r = i[o](e, t);
            if (r) return r
        }
    });
    var r = {
        rangeFinder: e.fold.auto,
        widget: "↔",
        minFoldSize: 0,
        scanUp: !1
    };
    e.defineOption("foldOptions", null),
    e.defineExtension("foldOption",
    function(e, t) {
        return o(this, e, t)
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror"), require("./foldcode")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror", "./foldcode"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e) {
        this.options = e,
        this.from = this.to = 0
    }
    function i(e) {
        return e === !0 && (e = {}),
        null == e.gutter && (e.gutter = "CodeMirror-foldgutter"),
        null == e.indicatorOpen && (e.indicatorOpen = "CodeMirror-foldgutter-open"),
        null == e.indicatorFolded && (e.indicatorFolded = "CodeMirror-foldgutter-folded"),
        e
    }
    function o(e, t) {
        for (var i = e.findMarksAt(h(t)), o = 0; o < i.length; ++o) if (i[o].__isFold && i[o].find().from.line == t) return ! 0
    }
    function r(e) {
        if ("string" == typeof e) {
            var t = document.createElement("div");
            return t.className = e + " CodeMirror-guttermarker-subtle",
            t
        }
        return e.cloneNode(!0)
    }
    function n(e, t, i) {
        var n = e.state.foldGutter.options,
        a = t,
        s = e.foldOption(n, "minFoldSize"),
        l = e.foldOption(n, "rangeFinder");
        e.eachLine(t, i,
        function(t) {
            var i = null;
            if (o(e, a)) i = r(n.indicatorFolded);
            else {
                var c = h(a, 0),
                d = l && l(e, c);
                d && d.to.line - d.from.line >= s && (i = r(n.indicatorOpen))
            }
            e.setGutterMarker(t, n.gutter, i),
            ++a
        })
    }
    function a(e) {
        var t = e.getViewport(),
        i = e.state.foldGutter;
        i && (e.operation(function() {
            n(e, t.from, t.to)
        }), i.from = t.from, i.to = t.to)
    }
    function s(e, t, i) {
        var o = e.state.foldGutter;
        if (o) {
            var r = o.options;
            i == r.gutter && e.foldCode(h(t, 0), r.rangeFinder)
        }
    }
    function l(e) {
        var t = e.state.foldGutter;
        if (t) {
            var i = t.options;
            t.from = t.to = 0,
            clearTimeout(t.changeUpdate),
            t.changeUpdate = setTimeout(function() {
                a(e)
            },
            i.foldOnChangeTimeSpan || 600)
        }
    }
    function c(e) {
        var t = e.state.foldGutter;
        if (t) {
            var i = t.options;
            clearTimeout(t.changeUpdate),
            t.changeUpdate = setTimeout(function() {
                var i = e.getViewport();
                t.from == t.to || i.from - t.to > 20 || t.from - i.to > 20 ? a(e) : e.operation(function() {
                    i.from < t.from && (n(e, i.from, t.from), t.from = i.from),
                    i.to > t.to && (n(e, t.to, i.to), t.to = i.to)
                })
            },
            i.updateViewportTimeSpan || 400)
        }
    }
    function d(e, t) {
        var i = e.state.foldGutter;
        if (i) {
            var o = t.line;
            o >= i.from && o < i.to && n(e, o, o + 1)
        }
    }
    e.defineOption("foldGutter", !1,
    function(o, r, n) {
        n && n != e.Init && (o.clearGutter(o.state.foldGutter.options.gutter), o.state.foldGutter = null, o.off("gutterClick", s), o.off("change", l), o.off("viewportChange", c), o.off("fold", d), o.off("unfold", d), o.off("swapDoc", a)),
        r && (o.state.foldGutter = new t(i(r)), a(o), o.on("gutterClick", s), o.on("change", l), o.on("viewportChange", c), o.on("fold", d), o.on("unfold", d), o.on("swapDoc", a))
    });
    var h = e.Pos
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    e.registerHelper("fold", "indent",
    function(t, i) {
        var o = t.getOption("tabSize"),
        r = t.getLine(i.line);
        if (/\S/.test(r)) {
            for (var n = function(t) {
                return e.countColumn(t, null, o)
            },
            a = n(r), s = null, l = i.line + 1, c = t.lastLine(); c >= l; ++l) {
                var d = t.getLine(l),
                h = n(d);
                if (h > a) s = l;
                else if (/\S/.test(d)) break
            }
            return s ? {
                from: e.Pos(i.line, r.length),
                to: e.Pos(s, t.getLine(s).length)
            }: void 0
        }
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    e.registerHelper("fold", "brace",
    function(t, i) {
        function o(o) {
            for (var r = i.ch,
            l = 0;;) {
                var c = 0 >= r ? -1 : s.lastIndexOf(o, r - 1);
                if ( - 1 != c) {
                    if (1 == l && c < i.ch) break;
                    if (n = t.getTokenTypeAt(e.Pos(a, c + 1)), !/^(comment|string)/.test(n)) return c + 1;
                    r = c - 1
                } else {
                    if (1 == l) break;
                    l = 1,
                    r = s.length
                }
            }
        }
        var r, n, a = i.line,
        s = t.getLine(a),
        l = "{",
        c = "}",
        r = o("{");
        if (null == r && (l = "[", c = "]", r = o("[")), null != r) {
            var d, h, u = 1,
            f = t.lastLine();
            e: for (var g = a; f >= g; ++g) for (var p = t.getLine(g), m = g == a ? r: 0;;) {
                var v = p.indexOf(l, m),
                w = p.indexOf(c, m);
                if (0 > v && (v = p.length), 0 > w && (w = p.length), m = Math.min(v, w), m == p.length) break;
                if (t.getTokenTypeAt(e.Pos(g, m + 1)) == n) if (m == v)++u;
                else if (!--u) {
                    d = g,
                    h = m;
                    break e
                }++m
            }
            if (null != d && (a != d || h != r)) return {
                from: e.Pos(a, r),
                to: e.Pos(d, h)
            }
        }
    }),
    e.registerHelper("fold", "import",
    function(t, i) {
        function o(i) {
            if (i < t.firstLine() || i > t.lastLine()) return null;
            var o = t.getTokenAt(e.Pos(i, 1));
            if (/\S/.test(o.string) || (o = t.getTokenAt(e.Pos(i, o.end + 1))), "keyword" != o.type || "import" != o.string) return null;
            for (var r = i,
            n = Math.min(t.lastLine(), i + 10); n >= r; ++r) {
                var a = t.getLine(r),
                s = a.indexOf(";");
                if ( - 1 != s) return {
                    startCh: o.end,
                    end: e.Pos(r, s)
                }
            }
        }
        var r, i = i.line,
        n = o(i);
        if (!n || o(i - 1) || (r = o(i - 2)) && r.end.line == i - 1) return null;
        for (var a = n.end;;) {
            var s = o(a.line + 1);
            if (null == s) break;
            a = s.end
        }
        return {
            from: t.clipPos(e.Pos(i, n.startCh + 1)),
            to: a
        }
    }),
    e.registerHelper("fold", "include",
    function(t, i) {
        function o(i) {
            if (i < t.firstLine() || i > t.lastLine()) return null;
            var o = t.getTokenAt(e.Pos(i, 1));
            return /\S/.test(o.string) || (o = t.getTokenAt(e.Pos(i, o.end + 1))),
            "meta" == o.type && "#include" == o.string.slice(0, 8) ? o.start + 8 : void 0
        }
        var i = i.line,
        r = o(i);
        if (null == r || null != o(i - 1)) return null;
        for (var n = i;;) {
            var a = o(n + 1);
            if (null == a) break; ++n
        }
        return {
            from: e.Pos(i, r + 1),
            to: t.clipPos(e.Pos(n))
        }
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    function t(e, t) {
        return e.line - t.line || e.ch - t.ch
    }
    function i(e, t, i, o) {
        this.line = t,
        this.ch = i,
        this.cm = e,
        this.text = e.getLine(t),
        this.min = o ? o.from: e.firstLine(),
        this.max = o ? o.to - 1 : e.lastLine()
    }
    function o(e, t) {
        var i = e.cm.getTokenTypeAt(u(e.line, t));
        return i && /\btag\b/.test(i)
    }
    function r(e) {
        return e.line >= e.max ? void 0 : (e.ch = 0, e.text = e.cm.getLine(++e.line), !0)
    }
    function n(e) {
        return e.line <= e.min ? void 0 : (e.text = e.cm.getLine(--e.line), e.ch = e.text.length, !0)
    }
    function a(e) {
        for (;;) {
            var t = e.text.indexOf(">", e.ch);
            if ( - 1 == t) {
                if (r(e)) continue;
                return
            } {
                if (o(e, t + 1)) {
                    var i = e.text.lastIndexOf("/", t),
                    n = i > -1 && !/\S/.test(e.text.slice(i + 1, t));
                    return e.ch = t + 1,
                    n ? "selfClose": "regular"
                }
                e.ch = t + 1
            }
        }
    }
    function s(e) {
        for (;;) {
            var t = e.ch ? e.text.lastIndexOf("<", e.ch - 1) : -1;
            if ( - 1 == t) {
                if (n(e)) continue;
                return
            }
            if (o(e, t + 1)) {
                p.lastIndex = t,
                e.ch = t;
                var i = p.exec(e.text);
                if (i && i.index == t) return i
            } else e.ch = t
        }
    }
    function l(e) {
        for (;;) {
            p.lastIndex = e.ch;
            var t = p.exec(e.text);
            if (!t) {
                if (r(e)) continue;
                return
            } {
                if (o(e, t.index + 1)) return e.ch = t.index + t[0].length,
                t;
                e.ch = t.index + 1
            }
        }
    }
    function c(e) {
        for (;;) {
            var t = e.ch ? e.text.lastIndexOf(">", e.ch - 1) : -1;
            if ( - 1 == t) {
                if (n(e)) continue;
                return
            } {
                if (o(e, t + 1)) {
                    var i = e.text.lastIndexOf("/", t),
                    r = i > -1 && !/\S/.test(e.text.slice(i + 1, t));
                    return e.ch = t + 1,
                    r ? "selfClose": "regular"
                }
                e.ch = t
            }
        }
    }
    function d(e, t) {
        for (var i = [];;) {
            var o, r = l(e),
            n = e.line,
            s = e.ch - (r ? r[0].length: 0);
            if (!r || !(o = a(e))) return;
            if ("selfClose" != o) if (r[1]) {
                for (var c = i.length - 1; c >= 0; --c) if (i[c] == r[2]) {
                    i.length = c;
                    break
                }
                if (0 > c && (!t || t == r[2])) return {
                    tag: r[2],
                    from: u(n, s),
                    to: u(e.line, e.ch)
                }
            } else i.push(r[2])
        }
    }
    function h(e, t) {
        for (var i = [];;) {
            var o = c(e);
            if (!o) return;
            if ("selfClose" != o) {
                var r = e.line,
                n = e.ch,
                a = s(e);
                if (!a) return;
                if (a[1]) i.push(a[2]);
                else {
                    for (var l = i.length - 1; l >= 0; --l) if (i[l] == a[2]) {
                        i.length = l;
                        break
                    }
                    if (0 > l && (!t || t == a[2])) return {
                        tag: a[2],
                        from: u(e.line, e.ch),
                        to: u(r, n)
                    }
                }
            } else s(e)
        }
    }
    var u = e.Pos,
    f = "A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD",
    g = f + "-:.0-9\\u00B7\\u0300-\\u036F\\u203F-\\u2040",
    p = new RegExp("<(/?)([" + f + "][" + g + "]*)", "g");
    e.registerHelper("fold", "xml",
    function(e, t) {
        for (var o = new i(e, t.line, 0);;) {
            var r, n = l(o);
            if (!n || o.line != t.line || !(r = a(o))) return;
            if (!n[1] && "selfClose" != r) {
                var t = u(o.line, o.ch),
                s = d(o, n[2]);
                return s && {
                    from: t,
                    to: s.from
                }
            }
        }
    }),
    e.findMatchingTag = function(e, o, r) {
        var n = new i(e, o.line, o.ch, r);
        if ( - 1 != n.text.indexOf(">") || -1 != n.text.indexOf("<")) {
            var l = a(n),
            c = l && u(n.line, n.ch),
            f = l && s(n);
            if (l && f && !(t(n, o) > 0)) {
                var g = {
                    from: u(n.line, n.ch),
                    to: c,
                    tag: f[2]
                };
                return "selfClose" == l ? {
                    open: g,
                    close: null,
                    at: "open"
                }: f[1] ? {
                    open: h(n, f[2]),
                    close: g,
                    at: "close"
                }: (n = new i(e, c.line, c.ch, r), {
                    open: g,
                    close: d(n, f[2]),
                    at: "open"
                })
            }
        }
    },
    e.findEnclosingTag = function(e, t, o) {
        for (var r = new i(e, t.line, t.ch, o);;) {
            var n = h(r);
            if (!n) break;
            var a = new i(e, t.line, t.ch, o),
            s = d(a, n.tag);
            if (s) return {
                open: n,
                close: s
            }
        }
    },
    e.scanForClosingTag = function(e, t, o, r) {
        var n = new i(e, t.line, t.ch, r ? {
            from: 0,
            to: r
        }: null);
        return d(n, o)
    }
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    e.registerHelper("fold", "markdown",
    function(t, i) {
        function o(i) {
            var o = t.getTokenTypeAt(e.Pos(i, 0));
            return o && /\bheader\b/.test(o)
        }
        function r(e, t, i) {
            var r = t && t.match(/^#+/);
            return r && o(e) ? r[0].length: (r = i && i.match(/^[=\-]+\s*$/), r && o(e + 1) ? "=" == i[0] ? 1 : 2 : n)
        }
        var n = 100,
        a = t.getLine(i.line),
        s = t.getLine(i.line + 1),
        l = r(i.line, a, s);
        if (l === n) return void 0;
        for (var c = t.lastLine(), d = i.line, h = t.getLine(d + 2); c > d && !(r(d + 1, s, h) <= l);)++d,
        s = h,
        h = t.getLine(d + 2);
        return {
            from: e.Pos(i.line, a.length),
            to: e.Pos(d, t.getLine(d).length)
        }
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    e.registerGlobalHelper("fold", "comment",
    function(e) {
        return e.blockCommentStart && e.blockCommentEnd
    },
    function(t, i) {
        var o = t.getModeAt(i),
        r = o.blockCommentStart,
        n = o.blockCommentEnd;
        if (r && n) {
            for (var a, s = i.line,
            l = t.getLine(s), c = i.ch, d = 0;;) {
                var h = 0 >= c ? -1 : l.lastIndexOf(r, c - 1);
                if ( - 1 != h) {
                    if (1 == d && h < i.ch) return;
                    if (/comment/.test(t.getTokenTypeAt(e.Pos(s, h + 1)))) {
                        a = h + r.length;
                        break
                    }
                    c = h - 1
                } else {
                    if (1 == d) return;
                    d = 1,
                    c = l.length
                }
            }
            var u, f, g = 1,
            p = t.lastLine();
            e: for (var m = s; p >= m; ++m) for (var v = t.getLine(m), w = m == s ? a: 0;;) {
                var b = v.indexOf(r, w),
                y = v.indexOf(n, w);
                if (0 > b && (b = v.length), 0 > y && (y = v.length), w = Math.min(b, y), w == v.length) break;
                if (w == b)++g;
                else if (!--g) {
                    u = m,
                    f = w;
                    break e
                }++w
            }
            if (null != u && (s != u || f != a)) return {
                from: e.Pos(s, a),
                to: e.Pos(u, f)
            }
        }
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    "use strict";
    e.overlayMode = function(t, i, o) {
        return {
            startState: function() {
                return {
                    base: e.startState(t),
                    overlay: e.startState(i),
                    basePos: 0,
                    baseCur: null,
                    overlayPos: 0,
                    overlayCur: null,
                    streamSeen: null
                }
            },
            copyState: function(o) {
                return {
                    base: e.copyState(t, o.base),
                    overlay: e.copyState(i, o.overlay),
                    basePos: o.basePos,
                    baseCur: null,
                    overlayPos: o.overlayPos,
                    overlayCur: null
                }
            },
            token: function(e, r) {
                return (e != r.streamSeen || Math.min(r.basePos, r.overlayPos) < e.start) && (r.streamSeen = e, r.basePos = r.overlayPos = e.start),
                e.start == r.basePos && (r.baseCur = t.token(e, r.base), r.basePos = e.pos),
                e.start == r.overlayPos && (e.pos = e.start, r.overlayCur = i.token(e, r.overlay), r.overlayPos = e.pos),
                e.pos = Math.min(r.basePos, r.overlayPos),
                null == r.overlayCur ? r.baseCur: null != r.baseCur && r.overlay.combineTokens || o && null == r.overlay.combineTokens ? r.baseCur + " " + r.overlayCur: r.overlayCur
            },
            indent: t.indent &&
            function(e, i) {
                return t.indent(e.base, i)
            },
            electricChars: t.electricChars,
            innerMode: function(e) {
                return {
                    state: e.base,
                    mode: t
                }
            },
            blankLine: function(e) {
                t.blankLine && t.blankLine(e.base),
                i.blankLine && i.blankLine(e.overlay)
            }
        }
    }
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror);

} (function(e) {
    "use strict";
    function t(e) {
        for (var t = 0; t < e.state.activeLines.length; t++) e.removeLineClass(e.state.activeLines[t], "wrap", n),
        e.removeLineClass(e.state.activeLines[t], "background", a)
    }
    function i(e, t) {
        if (e.length != t.length) return ! 1;
        for (var i = 0; i < e.length; i++) if (e[i] != t[i]) return ! 1;
        return ! 0
    }
    function o(e, o) {
        for (var r = [], s = 0; s < o.length; s++) {
            var l = o[s];
            if (l.empty()) {
                var c = e.getLineHandleVisualStart(l.head.line);
                r[r.length - 1] != c && r.push(c)
            }
        }
        i(e.state.activeLines, r) || e.operation(function() {
            t(e);
            for (var i = 0; i < r.length; i++) e.addLineClass(r[i], "wrap", n),
            e.addLineClass(r[i], "background", a);
            e.state.activeLines = r
        })
    }
    function r(e, t) {
        o(e, t.ranges)
    }
    var n = "CodeMirror-activeline",
    a = "CodeMirror-activeline-background";
    e.defineOption("styleActiveLine", !1,
    function(i, n, a) {
        var s = a && a != e.Init;
        n && !s ? (i.state.activeLines = [], o(i, i.listSelections()), i.on("beforeSelectionChange", r)) : !n && s && (i.off("beforeSelectionChange", r), t(i), delete i.state.activeLines)
    })
}),
function(e) {
    "object" == typeof exports && "object" == typeof module ? e(require("../codemirror")) : "function" == typeof define && define.amd ? define(["../../lib/codemirror"], e) : e(CodeMirror)
} (function(e) {
    function t(e, t) {
        var i = e.getRange(c(t.line, t.ch - 1), c(t.line, t.ch + 1));
        return 2 == i.length ? i: null
    }
    function i(t, i, o) {
        var r = t.getLine(i.line),
        n = t.getTokenAt(i);
        if (/\bstring2?\b/.test(n.type)) return ! 1;
        var a = new e.StringStream(r.slice(0, i.ch) + o + r.slice(i.ch), 4);
        for (a.pos = a.start = n.start;;) {
            var s = t.getMode().token(a, n.state);
            if (a.pos >= i.ch + 1) return /\bstring2?\b/.test(s);
            a.start = a.pos
        }
    }
    function o(o, r) {
        for (var n = {
            name: "autoCloseBrackets",
            Backspace: function(i) {
                if (i.getOption("disableInput")) return e.Pass;
                for (var r = i.listSelections(), n = 0; n < r.length; n++) {
                    if (!r[n].empty()) return e.Pass;
                    var a = t(i, r[n].head);
                    if (!a || o.indexOf(a) % 2 != 0) return e.Pass
                }
                for (var n = r.length - 1; n >= 0; n--) {
                    var s = r[n].head;
                    i.replaceRange("", c(s.line, s.ch - 1), c(s.line, s.ch + 1))
                }
            }
        },
        a = "", s = 0; s < o.length; s += 2)(function(t, o) {
            a += o,
            n["'" + t + "'"] = function(n) {
                if (n.getOption("disableInput")) return e.Pass;
                for (var s, d, h = n.listSelections(), u = 0; u < h.length; u++) {
                    var f, g = h[u],
                    p = g.head,
                    d = n.getRange(p, c(p.line, p.ch + 1));
                    if (g.empty()) if (t == o && d == o) f = n.getRange(p, c(p.line, p.ch + 3)) == t + t + t ? "skipThree": "skip";
                    else if (t == o && p.ch > 1 && r.indexOf(t) >= 0 && n.getRange(c(p.line, p.ch - 2), p) == t + t && (p.ch <= 2 || n.getRange(c(p.line, p.ch - 3), c(p.line, p.ch - 2)) != t)) f = "addFour";
                    else if ('"' == t || "'" == t) {
                        if (e.isWordChar(d) || !i(n, p, t)) return e.Pass;
                        f = "both"
                    } else {
                        if (! (n.getLine(p.line).length == p.ch || a.indexOf(d) >= 0 || l.test(d))) return e.Pass;
                        f = "both"
                    } else f = "surround";
                    if (s) {
                        if (s != f) return e.Pass
                    } else s = f
                }
                n.operation(function() {
                    if ("skip" == s) n.execCommand("goCharRight");
                    else if ("skipThree" == s) for (var e = 0; 3 > e; e++) n.execCommand("goCharRight");
                    else if ("surround" == s) {
                        for (var i = n.getSelections(), e = 0; e < i.length; e++) i[e] = t + i[e] + o;
                        n.replaceSelections(i, "around")
                    } else "both" == s ? (n.replaceSelection(t + o, null), n.execCommand("goCharLeft")) : "addFour" == s && (n.replaceSelection(t + t + t + t, "before"), n.execCommand("goCharRight"))
                })
            },
            t != o && (n["'" + o + "'"] = function(t) {
                for (var i = t.listSelections(), r = 0; r < i.length; r++) {
                    var n = i[r];
                    if (!n.empty() || t.getRange(n.head, c(n.head.line, n.head.ch + 1)) != o) return e.Pass
                }
                t.execCommand("goCharRight")
            })
        })(o.charAt(s), o.charAt(s + 1));
        return n
    }
    function r(i) {
        return function(o) {
            if (o.getOption("disableInput")) return e.Pass;
            for (var r = o.listSelections(), n = 0; n < r.length; n++) {
                if (!r[n].empty()) return e.Pass;
                var a = t(o, r[n].head);
                if (!a || i.indexOf(a) % 2 != 0) return e.Pass
            }
            o.operation(function() {
                o.replaceSelection("\n\n", null),
                o.execCommand("goCharLeft"),
                r = o.listSelections();
                for (var e = 0; e < r.length; e++) {
                    var t = r[e].head.line;
                    o.indentLine(t, null, !0),
                    o.indentLine(t + 1, null, !0)
                }
            })
        }
    }
    var n = "()[]{}''\"\"",
    a = "'\"",
    s = "[]{}",
    l = /\s/,
    c = e.Pos;
    e.defineOption("autoCloseBrackets", !1,
    function(t, i, l) {
        if (l != e.Init && l && t.removeKeyMap("autoCloseBrackets"), i) {
            var c = n,
            d = a,
            h = s;
            "string" == typeof i ? c = i: "object" == typeof i && (null != i.pairs && (c = i.pairs), null != i.triples && (d = i.triples), null != i.explode && (h = i.explode));
            var u = o(c, d);
            h && (u.Enter = r(h)),
            t.addKeyMap(u)
        }
    })
}),
// 全屏
(function(mod) {
    if (typeof exports == "object" && typeof module == "object") // CommonJS
      mod(require("../codemirror"));
    else if (typeof define == "function" && define.amd) // AMD
      define(["../../lib/codemirror"], mod);
    else // Plain browser env
      mod(CodeMirror);
  })(function(CodeMirror) {
    "use strict";
  
    CodeMirror.defineOption("fullScreen", false, function(cm, val, old) {
      if (old == CodeMirror.Init) old = false;
      if (!old == !val) return;
      if (val) setFullscreen(cm);
      else setNormal(cm);
    });
  
    function setFullscreen(cm) {
      var wrap = cm.getWrapperElement();
      cm.state.fullScreenRestore = {scrollTop: window.pageYOffset, scrollLeft: window.pageXOffset,
                                    width: wrap.style.width, height: wrap.style.height};
      wrap.style.width = "";
      wrap.style.height = "auto";
      wrap.className += " CodeMirror-fullscreen";
      document.documentElement.style.overflow = "hidden";
      cm.refresh();
    }
  
    function setNormal(cm) {
      var wrap = cm.getWrapperElement();
      wrap.className = wrap.className.replace(/\s*CodeMirror-fullscreen\b/, "");
      document.documentElement.style.overflow = "";
      var info = cm.state.fullScreenRestore;
      wrap.style.width = info.width; wrap.style.height = info.height;
      window.scrollTo(info.scrollLeft, info.scrollTop);
      cm.refresh();
    }
  }),
// 搜索结果高亮
(function(mod) {
    if (typeof exports == "object" && typeof module == "object") // CommonJS
      mod(require("../codemirror"), require("./matchesonscrollbar"));
    else if (typeof define == "function" && define.amd) // AMD
      define(["../../lib/codemirror", "./matchesonscrollbar"], mod);
    else // Plain browser env
      mod(CodeMirror);
  })(function(CodeMirror) {
    "use strict";
  
    var defaults = {
      style: "matchhighlight",
      minChars: 2,
      delay: 100,
      wordsOnly: false,
      annotateScrollbar: false,
      showToken: false,
      trim: true
    }
  
    function State(options) {
      this.options = {}
      for (var name in defaults)
        this.options[name] = (options && options.hasOwnProperty(name) ? options : defaults)[name]
      this.overlay = this.timeout = null;
      this.matchesonscroll = null;
      this.active = false;
    }
  
    CodeMirror.defineOption("highlightSelectionMatches", false, function(cm, val, old) {
      if (old && old != CodeMirror.Init) {
        removeOverlay(cm);
        clearTimeout(cm.state.matchHighlighter.timeout);
        cm.state.matchHighlighter = null;
        cm.off("cursorActivity", cursorActivity);
        cm.off("focus", onFocus)
      }
      if (val) {
        var state = cm.state.matchHighlighter = new State(val);
        if (cm.hasFocus()) {
          state.active = true
          highlightMatches(cm)
        } else {
          cm.on("focus", onFocus)
        }
        cm.on("cursorActivity", cursorActivity);
      }
    });
  
    function cursorActivity(cm) {
      var state = cm.state.matchHighlighter;
      if (state.active || cm.hasFocus()) scheduleHighlight(cm, state)
    }
  
    function onFocus(cm) {
      var state = cm.state.matchHighlighter
      if (!state.active) {
        state.active = true
        scheduleHighlight(cm, state)
      }
    }
  
    function scheduleHighlight(cm, state) {
      clearTimeout(state.timeout);
      state.timeout = setTimeout(function() {highlightMatches(cm);}, state.options.delay);
    }
  
    function addOverlay(cm, query, hasBoundary, style) {
      var state = cm.state.matchHighlighter;
      cm.addOverlay(state.overlay = makeOverlay(query, hasBoundary, style));
      if (state.options.annotateScrollbar && cm.showMatchesOnScrollbar) {
        var searchFor = hasBoundary ? new RegExp((/\w/.test(query.charAt(0)) ? "\\b" : "") +
                                                 query.replace(/[\\\[.+*?(){|^$]/g, "\\$&") +
                                                 (/\w/.test(query.charAt(query.length - 1)) ? "\\b" : "")) : query;
        state.matchesonscroll = cm.showMatchesOnScrollbar(searchFor, false,
          {className: "CodeMirror-selection-highlight-scrollbar"});
      }
    }
  
    function removeOverlay(cm) {
      var state = cm.state.matchHighlighter;
      if (state.overlay) {
        cm.removeOverlay(state.overlay);
        state.overlay = null;
        if (state.matchesonscroll) {
          state.matchesonscroll.clear();
          state.matchesonscroll = null;
        }
      }
    }
  
    function highlightMatches(cm) {
      cm.operation(function() {
        var state = cm.state.matchHighlighter;
        removeOverlay(cm);
        if (!cm.somethingSelected() && state.options.showToken) {
          var re = state.options.showToken === true ? /[\w$]/ : state.options.showToken;
          var cur = cm.getCursor(), line = cm.getLine(cur.line), start = cur.ch, end = start;
          while (start && re.test(line.charAt(start - 1))) --start;
          while (end < line.length && re.test(line.charAt(end))) ++end;
          if (start < end)
            addOverlay(cm, line.slice(start, end), re, state.options.style);
          return;
        }
        var from = cm.getCursor("from"), to = cm.getCursor("to");
        if (from.line != to.line) return;
        if (state.options.wordsOnly && !isWord(cm, from, to)) return;
        var selection = cm.getRange(from, to)
        if (state.options.trim) selection = selection.replace(/^\s+|\s+$/g, "")
        if (selection.length >= state.options.minChars)
          addOverlay(cm, selection, false, state.options.style);
      });
    }
  
    function isWord(cm, from, to) {
      var str = cm.getRange(from, to);
      if (str.match(/^\w+$/) !== null) {
          if (from.ch > 0) {
              var pos = {line: from.line, ch: from.ch - 1};
              var chr = cm.getRange(pos, from);
              if (chr.match(/\W/) === null) return false;
          }
          if (to.ch < cm.getLine(from.line).length) {
              var pos = {line: to.line, ch: to.ch + 1};
              var chr = cm.getRange(to, pos);
              if (chr.match(/\W/) === null) return false;
          }
          return true;
      } else return false;
    }
  
    function boundariesAround(stream, re) {
      return (!stream.start || !re.test(stream.string.charAt(stream.start - 1))) &&
        (stream.pos == stream.string.length || !re.test(stream.string.charAt(stream.pos)));
    }
  
    function makeOverlay(query, hasBoundary, style) {
      return {token: function(stream) {
        if (stream.match(query) &&
            (!hasBoundary || boundariesAround(stream, hasBoundary)))
          return style;
        stream.next();
        stream.skipTo(query.charAt(0)) || stream.skipToEnd();
      }};
    }
  }),  
// 输入提示-自动填充
(function(mod) {
    if (typeof exports == "object" && typeof module == "object") // CommonJS
      mod(require("../codemirror"));
    else if (typeof define == "function" && define.amd) // AMD
      define(["../../lib/codemirror"], mod);
    else // Plain browser env
      mod(CodeMirror);
  })(function(CodeMirror) {
    "use strict";
  
    var HINT_ELEMENT_CLASS        = "CodeMirror-hint";
    var ACTIVE_HINT_ELEMENT_CLASS = "CodeMirror-hint-active";
  
    // This is the old interface, kept around for now to stay
    // backwards-compatible.
    CodeMirror.showHint = function(cm, getHints, options) {
      if (!getHints) return cm.showHint(options);
      if (options && options.async) getHints.async = true;
      var newOpts = {hint: getHints};
      if (options) for (var prop in options) newOpts[prop] = options[prop];
      return cm.showHint(newOpts);
    };
  
    CodeMirror.defineExtension("showHint", function(options) {
      options = parseOptions(this, this.getCursor("start"), options);
      var selections = this.listSelections()
      if (selections.length > 1) return;
      // By default, don't allow completion when something is selected.
      // A hint function can have a `supportsSelection` property to
      // indicate that it can handle selections.
      if (this.somethingSelected()) {
        if (!options.hint.supportsSelection) return;
        // Don't try with cross-line selections
        for (var i = 0; i < selections.length; i++)
          if (selections[i].head.line != selections[i].anchor.line) return;
      }
  
      if (this.state.completionActive) this.state.completionActive.close();
      var completion = this.state.completionActive = new Completion(this, options);
      if (!completion.options.hint) return;
  
      CodeMirror.signal(this, "startCompletion", this);
      completion.update(true);
    });
  
    CodeMirror.defineExtension("closeHint", function() {
      if (this.state.completionActive) this.state.completionActive.close()
    })
  
    function Completion(cm, options) {
      this.cm = cm;
      this.options = options;
      this.widget = null;
      this.debounce = 0;
      this.tick = 0;
      this.startPos = this.cm.getCursor("start");
      this.startLen = this.cm.getLine(this.startPos.line).length - this.cm.getSelection().length;
  
      var self = this;
      cm.on("cursorActivity", this.activityFunc = function() { self.cursorActivity(); });
    }
  
    var requestAnimationFrame = window.requestAnimationFrame || function(fn) {
      return setTimeout(fn, 1000/60);
    };
    var cancelAnimationFrame = window.cancelAnimationFrame || clearTimeout;
  
    Completion.prototype = {
      close: function() {
        if (!this.active()) return;
        this.cm.state.completionActive = null;
        this.tick = null;
        this.cm.off("cursorActivity", this.activityFunc);
  
        if (this.widget && this.data) CodeMirror.signal(this.data, "close");
        if (this.widget) this.widget.close();
        CodeMirror.signal(this.cm, "endCompletion", this.cm);
      },
  
      active: function() {
        return this.cm.state.completionActive == this;
      },
  
      pick: function(data, i) {
        var completion = data.list[i], self = this;
        this.cm.operation(function() {
          if (completion.hint)
            completion.hint(self.cm, data, completion);
          else
            self.cm.replaceRange(getText(completion), completion.from || data.from,
                                 completion.to || data.to, "complete");
          CodeMirror.signal(data, "pick", completion);
          self.cm.scrollIntoView();
        });
        if (this.options.closeOnPick) {
          this.close();
        }
      },
  
      cursorActivity: function() {
        if (this.debounce) {
          cancelAnimationFrame(this.debounce);
          this.debounce = 0;
        }
  
        var identStart = this.startPos;
        if(this.data) {
          identStart = this.data.from;
        }
  
        var pos = this.cm.getCursor(), line = this.cm.getLine(pos.line);
        if (pos.line != this.startPos.line || line.length - pos.ch != this.startLen - this.startPos.ch ||
            pos.ch < identStart.ch || this.cm.somethingSelected() ||
            (!pos.ch || this.options.closeCharacters.test(line.charAt(pos.ch - 1)))) {
          if (this.options.closeOnCursorActivity) {
            this.close();
          }
        } else {
          var self = this;
          this.debounce = requestAnimationFrame(function() {self.update();});
          if (this.widget) this.widget.disable();
        }
      },
  
      update: function(first) {
        if (this.tick == null) return
        var self = this, myTick = ++this.tick
        fetchHints(this.options.hint, this.cm, this.options, function(data) {
          if (self.tick == myTick) self.finishUpdate(data, first)
        })
      },
  
      finishUpdate: function(data, first) {
        if (this.data) CodeMirror.signal(this.data, "update");
  
        var picked = (this.widget && this.widget.picked) || (first && this.options.completeSingle);
        if (this.widget) this.widget.close();
  
        this.data = data;
  
        if (data && data.list.length) {
          if (picked && data.list.length == 1) {
            this.pick(data, 0);
          } else {
            this.widget = new Widget(this, data);
            CodeMirror.signal(data, "shown");
          }
        }
      }
    };
  
    function parseOptions(cm, pos, options) {
      var editor = cm.options.hintOptions;
      var out = {};
      for (var prop in defaultOptions) out[prop] = defaultOptions[prop];
      if (editor) for (var prop in editor)
        if (editor[prop] !== undefined) out[prop] = editor[prop];
      if (options) for (var prop in options)
        if (options[prop] !== undefined) out[prop] = options[prop];
      if (out.hint.resolve) out.hint = out.hint.resolve(cm, pos)
      return out;
    }
  
    function getText(completion) {
      if (typeof completion == "string") return completion;
      else return completion.text;
    }
  
    function buildKeyMap(completion, handle) {
      var baseMap = {
        Up: function() {handle.moveFocus(-1);},
        Down: function() {handle.moveFocus(1);},
        PageUp: function() {handle.moveFocus(-handle.menuSize() + 1, true);},
        PageDown: function() {handle.moveFocus(handle.menuSize() - 1, true);},
        Home: function() {handle.setFocus(0);},
        End: function() {handle.setFocus(handle.length - 1);},
        Enter: handle.pick,
        Tab: handle.pick,
        Esc: handle.close
      };
  
      var mac = /Mac/.test(navigator.platform);
  
      if (mac) {
        baseMap["Ctrl-P"] = function() {handle.moveFocus(-1);};
        baseMap["Ctrl-N"] = function() {handle.moveFocus(1);};
      }
  
      var custom = completion.options.customKeys;
      var ourMap = custom ? {} : baseMap;
      function addBinding(key, val) {
        var bound;
        if (typeof val != "string")
          bound = function(cm) { return val(cm, handle); };
        // This mechanism is deprecated
        else if (baseMap.hasOwnProperty(val))
          bound = baseMap[val];
        else
          bound = val;
        ourMap[key] = bound;
      }
      if (custom)
        for (var key in custom) if (custom.hasOwnProperty(key))
          addBinding(key, custom[key]);
      var extra = completion.options.extraKeys;
      if (extra)
        for (var key in extra) if (extra.hasOwnProperty(key))
          addBinding(key, extra[key]);
      return ourMap;
    }
  
    function getHintElement(hintsElement, el) {
      while (el && el != hintsElement) {
        if (el.nodeName.toUpperCase() === "LI" && el.parentNode == hintsElement) return el;
        el = el.parentNode;
      }
    }
  
    function Widget(completion, data) {
      this.completion = completion;
      this.data = data;
      this.picked = false;
      var widget = this, cm = completion.cm;
      var ownerDocument = cm.getInputField().ownerDocument;
      var parentWindow = ownerDocument.defaultView || ownerDocument.parentWindow;
  
      var hints = this.hints = ownerDocument.createElement("ul");
      var theme = completion.cm.options.theme;
      hints.className = "CodeMirror-hints " + theme;
      this.selectedHint = data.selectedHint || 0;
  
      var completions = data.list;
      for (var i = 0; i < completions.length; ++i) {
        var elt = hints.appendChild(ownerDocument.createElement("li")), cur = completions[i];
        var className = HINT_ELEMENT_CLASS + (i != this.selectedHint ? "" : " " + ACTIVE_HINT_ELEMENT_CLASS);
        if (cur.className != null) className = cur.className + " " + className;
        elt.className = className;
        if (cur.render) cur.render(elt, data, cur);
        else elt.appendChild(ownerDocument.createTextNode(cur.displayText || getText(cur)));
        elt.hintId = i;
      }
  
      var container = completion.options.container || ownerDocument.body;
      var pos = cm.cursorCoords(completion.options.alignWithWord ? data.from : null);
      var left = pos.left, top = pos.bottom, below = true;
      var offsetLeft = 0, offsetTop = 0;
      if (container !== ownerDocument.body) {
        // We offset the cursor position because left and top are relative to the offsetParent's top left corner.
        var isContainerPositioned = ['absolute', 'relative', 'fixed'].indexOf(parentWindow.getComputedStyle(container).position) !== -1;
        var offsetParent = isContainerPositioned ? container : container.offsetParent;
        var offsetParentPosition = offsetParent.getBoundingClientRect();
        var bodyPosition = ownerDocument.body.getBoundingClientRect();
        offsetLeft = (offsetParentPosition.left - bodyPosition.left - offsetParent.scrollLeft);
        offsetTop = (offsetParentPosition.top - bodyPosition.top - offsetParent.scrollTop);
      }
      hints.style.left = (left - offsetLeft) + "px";
      hints.style.top = (top - offsetTop) + "px";
  
      // If we're at the edge of the screen, then we want the menu to appear on the left of the cursor.
      var winW = parentWindow.innerWidth || Math.max(ownerDocument.body.offsetWidth, ownerDocument.documentElement.offsetWidth);
      var winH = parentWindow.innerHeight || Math.max(ownerDocument.body.offsetHeight, ownerDocument.documentElement.offsetHeight);
      container.appendChild(hints);
  
      var box = completion.options.moveOnOverlap ? hints.getBoundingClientRect() : new DOMRect();
      var scrolls = completion.options.paddingForScrollbar ? hints.scrollHeight > hints.clientHeight + 1 : false;
  
      // Compute in the timeout to avoid reflow on init
      var startScroll;
      setTimeout(function() { startScroll = cm.getScrollInfo(); });
  
      var overlapY = box.bottom - winH;
      if (overlapY > 0) {
        var height = box.bottom - box.top, curTop = pos.top - (pos.bottom - box.top);
        if (curTop - height > 0) { // Fits above cursor
          hints.style.top = (top = pos.top - height - offsetTop) + "px";
          below = false;
        } else if (height > winH) {
          hints.style.height = (winH - 5) + "px";
          hints.style.top = (top = pos.bottom - box.top - offsetTop) + "px";
          var cursor = cm.getCursor();
          if (data.from.ch != cursor.ch) {
            pos = cm.cursorCoords(cursor);
            hints.style.left = (left = pos.left - offsetLeft) + "px";
            box = hints.getBoundingClientRect();
          }
        }
      }
      var overlapX = box.right - winW;
      if (overlapX > 0) {
        if (box.right - box.left > winW) {
          hints.style.width = (winW - 5) + "px";
          overlapX -= (box.right - box.left) - winW;
        }
        hints.style.left = (left = pos.left - overlapX - offsetLeft) + "px";
      }
      if (scrolls) for (var node = hints.firstChild; node; node = node.nextSibling)
        node.style.paddingRight = cm.display.nativeBarWidth + "px"
  
      cm.addKeyMap(this.keyMap = buildKeyMap(completion, {
        moveFocus: function(n, avoidWrap) { widget.changeActive(widget.selectedHint + n, avoidWrap); },
        setFocus: function(n) { widget.changeActive(n); },
        menuSize: function() { return widget.screenAmount(); },
        length: completions.length,
        close: function() { completion.close(); },
        pick: function() { widget.pick(); },
        data: data
      }));
  
      if (completion.options.closeOnUnfocus) {
        var closingOnBlur;
        cm.on("blur", this.onBlur = function() { closingOnBlur = setTimeout(function() { completion.close(); }, 100); });
        cm.on("focus", this.onFocus = function() { clearTimeout(closingOnBlur); });
      }
  
      cm.on("scroll", this.onScroll = function() {
        var curScroll = cm.getScrollInfo(), editor = cm.getWrapperElement().getBoundingClientRect();
        var newTop = top + startScroll.top - curScroll.top;
        var point = newTop - (parentWindow.pageYOffset || (ownerDocument.documentElement || ownerDocument.body).scrollTop);
        if (!below) point += hints.offsetHeight;
        if (point <= editor.top || point >= editor.bottom) return completion.close();
        hints.style.top = newTop + "px";
        hints.style.left = (left + startScroll.left - curScroll.left) + "px";
      });
  
      CodeMirror.on(hints, "dblclick", function(e) {
        var t = getHintElement(hints, e.target || e.srcElement);
        if (t && t.hintId != null) {widget.changeActive(t.hintId); widget.pick();}
      });
  
      CodeMirror.on(hints, "click", function(e) {
        var t = getHintElement(hints, e.target || e.srcElement);
        if (t && t.hintId != null) {
          widget.changeActive(t.hintId);
          if (completion.options.completeOnSingleClick) widget.pick();
        }
      });
  
      CodeMirror.on(hints, "mousedown", function() {
        setTimeout(function(){cm.focus();}, 20);
      });
  
      // The first hint doesn't need to be scrolled to on init
      var selectedHintRange = this.getSelectedHintRange();
      if (selectedHintRange.from !== 0 || selectedHintRange.to !== 0) {
        this.scrollToActive();
      }
  
      CodeMirror.signal(data, "select", completions[this.selectedHint], hints.childNodes[this.selectedHint]);
      return true;
    }
  
    Widget.prototype = {
      close: function() {
        if (this.completion.widget != this) return;
        this.completion.widget = null;
        this.hints.parentNode.removeChild(this.hints);
        this.completion.cm.removeKeyMap(this.keyMap);
  
        var cm = this.completion.cm;
        if (this.completion.options.closeOnUnfocus) {
          cm.off("blur", this.onBlur);
          cm.off("focus", this.onFocus);
        }
        cm.off("scroll", this.onScroll);
      },
  
      disable: function() {
        this.completion.cm.removeKeyMap(this.keyMap);
        var widget = this;
        this.keyMap = {Enter: function() { widget.picked = true; }};
        this.completion.cm.addKeyMap(this.keyMap);
      },
  
      pick: function() {
        this.completion.pick(this.data, this.selectedHint);
      },
  
      changeActive: function(i, avoidWrap) {
        if (i >= this.data.list.length)
          i = avoidWrap ? this.data.list.length - 1 : 0;
        else if (i < 0)
          i = avoidWrap ? 0  : this.data.list.length - 1;
        if (this.selectedHint == i) return;
        var node = this.hints.childNodes[this.selectedHint];
        if (node) node.className = node.className.replace(" " + ACTIVE_HINT_ELEMENT_CLASS, "");
        node = this.hints.childNodes[this.selectedHint = i];
        node.className += " " + ACTIVE_HINT_ELEMENT_CLASS;
        this.scrollToActive()
        CodeMirror.signal(this.data, "select", this.data.list[this.selectedHint], node);
      },
  
      scrollToActive: function() {
        var selectedHintRange = this.getSelectedHintRange();
        var node1 = this.hints.childNodes[selectedHintRange.from];
        var node2 = this.hints.childNodes[selectedHintRange.to];
        var firstNode = this.hints.firstChild;
        if (node1.offsetTop < this.hints.scrollTop)
          this.hints.scrollTop = node1.offsetTop - firstNode.offsetTop;
        else if (node2.offsetTop + node2.offsetHeight > this.hints.scrollTop + this.hints.clientHeight)
          this.hints.scrollTop = node2.offsetTop + node2.offsetHeight - this.hints.clientHeight + firstNode.offsetTop;
      },
  
      screenAmount: function() {
        return Math.floor(this.hints.clientHeight / this.hints.firstChild.offsetHeight) || 1;
      },
  
      getSelectedHintRange: function() {
        var margin = this.completion.options.scrollMargin || 0;
        return {
          from: Math.max(0, this.selectedHint - margin),
          to: Math.min(this.data.list.length - 1, this.selectedHint + margin),
        };
      }
    };
  
    function applicableHelpers(cm, helpers) {
      if (!cm.somethingSelected()) return helpers
      var result = []
      for (var i = 0; i < helpers.length; i++)
        if (helpers[i].supportsSelection) result.push(helpers[i])
      return result
    }
  
    function fetchHints(hint, cm, options, callback) {
      if (hint.async) {
        hint(cm, callback, options)
      } else {
        var result = hint(cm, options)
        if (result && result.then) result.then(callback)
        else callback(result)
      }
    }
  
    function resolveAutoHints(cm, pos) {
      var helpers = cm.getHelpers(pos, "hint"), words
      if (helpers.length) {
        var resolved = function(cm, callback, options) {
          var app = applicableHelpers(cm, helpers);
          function run(i) {
            if (i == app.length) return callback(null)
            fetchHints(app[i], cm, options, function(result) {
              if (result && result.list.length > 0) callback(result)
              else run(i + 1)
            })
          }
          run(0)
        }
        resolved.async = true
        resolved.supportsSelection = true
        return resolved
      } else if (words = cm.getHelper(cm.getCursor(), "hintWords")) {
        return function(cm) { return CodeMirror.hint.fromList(cm, {words: words}) }
      } else if (CodeMirror.hint.anyword) {
        return function(cm, options) { return CodeMirror.hint.anyword(cm, options) }
      } else {
        return function() {}
      }
    }
  
    CodeMirror.registerHelper("hint", "auto", {
      resolve: resolveAutoHints
    });
  
    CodeMirror.registerHelper("hint", "fromList", function(cm, options) {
      var cur = cm.getCursor(), token = cm.getTokenAt(cur)
      var term, from = CodeMirror.Pos(cur.line, token.start), to = cur
      if (token.start < cur.ch && /\w/.test(token.string.charAt(cur.ch - token.start - 1))) {
        term = token.string.substr(0, cur.ch - token.start)
      } else {
        term = ""
        from = cur
      }
      var found = [];
      for (var i = 0; i < options.words.length; i++) {
        var word = options.words[i];
        if (word.slice(0, term.length) == term)
          found.push(word);
      }
  
      if (found.length) return {list: found, from: from, to: to};
    });
  
    CodeMirror.commands.autocomplete = CodeMirror.showHint;
  
    var defaultOptions = {
      hint: CodeMirror.hint.auto,
      completeSingle: true,
      alignWithWord: true,
      closeCharacters: /[\s()\[\]{};:>,]/,
      closeOnCursorActivity: true,
      closeOnPick: true,
      closeOnUnfocus: true,
      completeOnSingleClick: true,
      container: null,
      customKeys: null,
      extraKeys: null,
      paddingForScrollbar: true,
      moveOnOverlap: true,
    };
  
    CodeMirror.defineOption("hintOptions", null);
  });