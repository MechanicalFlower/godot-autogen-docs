<dl class="py class">
    <dt class="sig sig-object py" id="{{ name }}">
        <em class="property">
            <span class="pre">class</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">{{ name }}</span>
        </span>
        <em class="property">
            <span class="w"> </span>
            <span class="pre">extends</span>
            <span class="w"> </span>
        </em>
        <span class="sig-prename descclassname">
            <span class="pre">{{ extends_class }}</span>
        </span>
    </dt>
    <dd>
        <p>{{ description }}</p>
        {% for constant in constants %}
        <dl class="py attribute">
            <dt class="sig sig-object py" id="{{ constant.name }}">
                <em class="property">
                    <span class="pre">const</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">{{ constant.name }}</span>
                </span>
            </dt>
            <p>{{ constant.description }}</p>
        </dl>
        {% endfor %}
        {% for signal in signals %}
        <dl class="py attribute">
            <dt class="sig sig-object py" id="{{ signal.name }}">
                <em class="property">
                    <span class="pre">signal</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">{{ signal.name }}</span>
                </span>
            </dt>
            <p>{{ signal.description }}</p>
        </dl>
        {% endfor %}
        {% for member in members %}
        <dl class="py attribute">
            <dt class="sig sig-object py" id="{{ member.name }}">
                <em class="property">
                    <span class="pre">var</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">{{ member.name }}</span>
                </span>
            </dt>
            <p>{{ member.description }}</p>
        </dl>
        {% endfor %}
        {% for method in methods %}
        <dl class="py method">
            <dt class="sig sig-object py" id="{{ method.name }}">
                <em class="property">
                    <span class="pre">func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">{{ method.name }}</span>
                </span>
            </dt>
            <p>{{ method.description }}</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">
                        {% for arg in method.arguments %}
                        <li>
                            <p><strong>{{ arg.name }}</strong> (<em>{{ arg.type }}</em>)</p>
                        </li>
                        {% endfor %}
                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>{{ method.return_type }}</p>
                </dd>
            </dl>
        </dl>
        {% endfor %}
        {% for static_function in static_functions %}
        <dl class="py method">
            <dt class="sig sig-object py" id="{{ static_function.name }}">
                <em class="property">
                    <span class="pre">static func</span>
                    <span class="w"> </span>
                </em>
                <span class="sig-name descname">
                    <span class="pre">{{ static_function.name }}</span>
                </span>
            </dt>
            <p>{{ static_function.description }}</p>
            <dl class="field-list simple">
                <dt class="field-odd">Parameters<span class="colon">:</span></dt>
                <dd class="field-odd">
                    <ul class="simple">
                        {% for arg in static_function.arguments %}
                        <li>
                            <p><strong>{{ arg.name }}</strong> (<em>{{ arg.type }}</em>)</p>
                        </li>
                        {% endfor %}
                    </ul>
                </dd>
                <dt class="field-even">Return type<span class="colon">:</span></dt>
                <dd class="field-even">
                    <p>{{ static_function.return_type }}</p>
                </dd>
            </dl>
        </dl>
        {% endfor %}
    </dd>
</dl>
